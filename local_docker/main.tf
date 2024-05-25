terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"  # Ruta al socket de Docker en Windows
}

# Pulls the image
resource "docker_image" "versioner" {
  name = "agonzalezo/versioner:latest"
}

# Create a container
resource "docker_container" "web01" {
  image = docker_image.versioner.image_id
  name  = "web01"
  rm = true
  env = [ "APPVERSION=1.1.1" ]
  ports {
    external = 3000
    internal = 3000
  }
}