data "http" "my_ip" {
  url = "https://ifconfig.me"
  method = "GET"
}

resource "aws_security_group" "common_sg" {
  name = "${var.environment}_securityGroup"
  vpc_id      = var.my_vpc_id
  tags = {
    Name = "${var.environment}_securityGroup"
  }

  // Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["179.13.74.242/32"]
    description = "Allow SSH just from me."
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${data.http.my_ip.response_body}/32"]
    description = "Allow ICMP just from me."
  }

  ingress {
    from_port   = 3000
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["${data.http.my_ip.response_body}/32"]
    description = "Allow http apis just from me."
  }

  // Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}
