## Data sources
data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

## Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  default     = "10.10.0.0/16"
}

variable "environment" {
  default     = "DEV1"
  description = "Environment name used as preffix / suffix"
}

variable "az_numbers" {
  default = 2
  description = "amount of availability zones"
}