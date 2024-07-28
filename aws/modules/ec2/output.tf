output "ec2_dns" {
    value = {for index, data in aws_instance.web01 : index => data.public_dns}
}

output "ami_os" {
  value = data.aws_ami.ami_os.name
}
