output "web01a_id" {
  value = aws_instance.web01a.id
}
output "web01b_id" {
  value = aws_instance.web01b.id
}
output "web01a_ip" {
  value = aws_instance.web01a.public_ip
}
output "web01b_ip" {
  value = aws_instance.web01b.public_ip
}