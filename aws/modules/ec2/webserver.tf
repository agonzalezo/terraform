resource "aws_instance" "web01" {
  for_each = {for index, subnet in var.public_subnet_ids : index => subnet.id }
  ami               = data.aws_ami.ami_os.id
  instance_type     = var.instance_type
  key_name          = "${var.environment}_ssh_key"
  tags = {
    "Name" : "${var.environment}-${each.key}-web01"
  }
  subnet_id              = each.value
  vpc_security_group_ids = [var.security_group_id]
  
  #User data is limited to 16 KB
  user_data = file("C:\\Users\\Alex\\Documents\\Ares\\Developer\\Iac\\terraform\\aws\\modules\\ec2\\userData.sh")
}

# resource "aws_instance" "web02" {
#   for_each = {for index, subnet in var.public_subnet_ids : index => subnet.id }
#   ami               = var.ami_id
#   instance_type     = var.instance_type
#   key_name          = "${var.environment}_ssh_key"
#   tags = {
#     "Name" : "${var.environment}-web02"
#   }
#   subnet_id              = each.value
#   vpc_security_group_ids = [var.security_group_id]
  
#   #User data is limited to 16 KB
#   user_data = <<-EOF
#                 #!/bin/bash
#                 # ---> Updating, upgrating and installing the base
#                 apt update
#                 apt install python3-pip apt-transport-https ca-certificates curl software-properties-common -y
#                 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#                 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
#                 apt update && apt upgrade -y
#                 apt install docker-ce -y
#                 systemctl status docker
#                 usermod -aG docker ubuntu
#                 docker run -p 3000:80 -d nginxdemos/hello
#                 EOF
# }
