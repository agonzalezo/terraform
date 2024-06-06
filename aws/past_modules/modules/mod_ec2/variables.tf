variable "ami_id" {
  description = "amazon linux image id"
  default = "ami-0dfcb1ef8550277af"
}

variable "instance_type" {
  description = "EC2 instance type."
  default     = "t2.micro"
}

variable "env" {
  description = "Enviroment to deploy"
  default = "QA"
}

variable "aws_region" {
  description = "AWS region where resources will be created."
  default     = "us-east-1"
}