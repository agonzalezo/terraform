output "current_region" {
  depends_on = [data.aws_region.current]
  value      = data.aws_region.current.name
}

output "available_zones" {
  value = data.aws_availability_zones.available.names
}

output "PublicIP" {
  value = aws_eip.public_ip.public_ip
}

output "vpc_id" {
  value = aws_vpc.main.id
}