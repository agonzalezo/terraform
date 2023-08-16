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

# Create a container
resource "docker_container" "web01" {
  image = "nginx:latest"
  name  = "web01"
  rm = true
  env = [ "HOLA=CHAO" ]
  ports {
    internal = 80
    external = 8080
  }
}