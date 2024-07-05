## Create a VPC
resource "aws_vpc" "main" {

  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "${var.environment}_vpc"
  }
  cidr_block = var.vpc_cidr ## Static CIDR

  ## Prevent to destroy
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_subnet" "public" {
  #   depends_on = [ aws_vpc.main ]
  count                   = var.az_numbers ## Number of subnets
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index) ## Dynamic Subnet CIDR from a VPC main CIDR example: 10.10.0.0/24
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}_public_net_${count.index + 1}"
    Type = "public"
  }
}

resource "aws_subnet" "private" {
  #   depends_on = [ aws_vpc.main ]
  count             = var.az_numbers ## Number of subnets
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr, 6, 31 + count.index) ## Dynamic Subnet CIDR from a VPC main CIDR example: 10.10.124.0/22
  tags = {
    Name = "${var.environment}_private_net_${count.index + 1}"
    Type = "private"
  }
}

resource "aws_eip" "public_ip" {
  domain = "vpc"
  tags = {
    Name = "${var.environment}_eip"
  }
}

resource "aws_internet_gateway" "main" {
  depends_on = [aws_eip.public_ip]
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "${var.environment}_igw"
  }
}

resource "aws_nat_gateway" "main" {
  depends_on        = [aws_internet_gateway.main]
  allocation_id     = aws_eip.public_ip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public[0].id
  tags = {
    Name = "${var.environment}_ngw"
  }
}