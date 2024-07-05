terraform {
  backend "s3" {
    bucket  = "netsys-terraform-prod"
    key     = "aws/main.tfstate"
    region  = "us-east-1"
    encrypt = true
    profile = "default"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.my_region
  profile = var.my_profile
  default_tags {
    tags = {
      By      = "Terraform"
      Project = "Netsys"
    }
  }
}

## Import whole infrastructure
module "infra" {
  source      = "./modules/infra"
  environment = "DEV1"
  vpc_cidr    = "10.10.0.0/16"

}

## Import whole infrastructure
module "infra2" {
  source      = "./modules/infra"
  environment = "QA1"
  vpc_cidr = "10.20.0.0/16"
}
