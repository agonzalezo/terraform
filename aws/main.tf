terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

module "mod_ec2" {
  source = "./modules/mod_ec2"
}