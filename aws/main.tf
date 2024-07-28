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

## Deploy Network Infrastructure for an environment
module "dev_infrastructure" {
  source      = "./modules/infrastructure"
  environment = "DEV"
  vpc_cidr    = "10.10.0.0/16"
  az_numbers = 3
}

## Deploy a security components like a security groups and ssh keys
module "dev_security" {
  source = "./modules/security"
  environment = "DEV"
  my_vpc_id = module.dev_infrastructure.vpc_id
}

## Deploy a security components like a security groups and ssh keys
module "dev_ec2" {
  source = "./modules/ec2"
  environment = "DEV"
  public_subnet_ids = module.dev_infrastructure.public_subnet_ids
  security_group_id = module.dev_security.security_group_id
}