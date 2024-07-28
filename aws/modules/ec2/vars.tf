data "aws_ami" "ami_os" {
  most_recent = true
  owners = [ "amazon" ]
  # name_regex = "^Amazon Linux.*"
  name_regex = "^ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.*"

  filter {
    name = "architecture"
    values = [ "x86_64" ] # arm64
  }
}

## Variables
variable "security_group_id" {
  type = string
  description = "Security group id to associate with ec2"
}

variable "public_subnet_ids" {
  description = "Subnet ids to create ec2."
}

variable "ami_id" {
  description = "amazon linux image id"
  default = "ami-04a81a99f5ec58529" ## Ubuntu
  # default = "ami-0dfcb1ef8550277af" ## Amazon Linux
}

variable "instance_type" {
  description = "EC2 instance type."
  default     = "t2.micro"
}

variable "environment" {
  # default     = "DEV"
  description = "Environment name used as prefix / suffix"
}