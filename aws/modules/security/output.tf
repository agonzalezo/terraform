output "security_group_id" {
  value = aws_security_group.common_sg.id
}

output "my_public_ip" {
  value = data.http.my_ip.response_body
}