variable "env" {
  description = "Enviroment to deploy"
  default = "QA"
}

variable "aws_region" {
  description = "AWS region where resources will be created."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_public_1_cidr" {
  description = "CIDR block for public subnet 1."
  default     = "10.0.1.0/24"
}

variable "subnet_public_2_cidr" {
  description = "CIDR block for public subnet 2."
  default     = "10.0.2.0/24"
}

variable "subnet_private_1_cidr" {
  description = "CIDR block for private subnet 1."
  default     = "10.0.201.0/24"
}

variable "subnet_private_2_cidr" {
  description = "CIDR block for private subnet 2."
  default     = "10.0.202.0/24"
}
