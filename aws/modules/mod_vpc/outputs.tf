output "vpc_id" {
  value = aws_vpc.MAIN_VPC.id
}
output "MAIN_VPC_SG" {
  value = aws_security_group.MAIN_VPC_SG.id
}
output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}
output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}
output "internet_gateway_id" {
  value = aws_internet_gateway.MAIN_IG.id
}