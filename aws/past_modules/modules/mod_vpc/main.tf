resource "aws_vpc" "MAIN_VPC" {
  enable_dns_hostnames = true
  enable_dns_support   = true
  cidr_block           = var.vpc_cidr
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-MAIN_VPC"
  }
}

resource "aws_security_group" "MAIN_VPC_SG" {
  name_prefix = "MAIN_VPC_SG-"
  vpc_id      = aws_vpc.MAIN_VPC.id

  // Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["191.92.17.213/32"]
  }

  // Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.MAIN_VPC.id
  cidr_block              = var.subnet_public_1_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-public_net1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.MAIN_VPC.id
  cidr_block              = var.subnet_public_2_cidr
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-public_net2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.MAIN_VPC.id
  cidr_block        = var.subnet_private_1_cidr
  availability_zone = "${var.aws_region}a"
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-private_net1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.MAIN_VPC.id
  cidr_block        = var.subnet_private_2_cidr
  availability_zone = "${var.aws_region}b"
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-private_net2"
  }
}

resource "aws_internet_gateway" "MAIN_IG" {
  vpc_id = aws_vpc.MAIN_VPC.id
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-IG"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.MAIN_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MAIN_IG.id
  }
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-public_route_table"
  }
}

resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}
