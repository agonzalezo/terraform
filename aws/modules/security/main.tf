terraform {
  backend "s3" {
    bucket = "netsys-terraform-prod"
    key = "aws/security.tfstate"
    region = "us-east-1"
    encrypt = true
    profile = "default"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Configuration options
  default_tags {
    tags = {
      By= "Terraform"
      Project= "Netsys"
    }
  }
}