## Data sources
data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

## Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  # default     = "10.10.0.0/16"
}

variable "environment" {
  # default     = "DEV1"
  description = "Environment name used as prefix / suffix"
}

variable "az_numbers" {
  type = number
  # default = 2
  description = "amount of availability zones"
}