module "vpc" {
  source = "../mod_vpc"
}

resource "aws_instance" "web01a" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "${var.aws_region}a"
  key_name          = "netsys"
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-web01a"
  }
  subnet_id       = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = [module.vpc.MAIN_VPC_SG]
}

resource "aws_instance" "web01b" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "${var.aws_region}b"
  key_name          = "netsys"
  tags = {
    "by" : "terraform"
    "Name" : "${var.env}-web01b"
  }
  subnet_id       = module.vpc.public_subnet_ids[1]
  vpc_security_group_ids = [module.vpc.MAIN_VPC_SG]
}
