resource "aws_route_table" "public_route_table" {
  vpc_id     = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.environment}_public_routes"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id     = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.environment}_private_routes"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = var.az_numbers
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table.id
  depends_on     = [aws_route_table.public_route_table, aws_subnet.public]
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = var.az_numbers
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table.id
  depends_on     = [aws_route_table.private_route_table, aws_subnet.private]

}

### Implementation using for-each and data sources (don't work well, it require to execute terraform apply two times)

# data "aws_subnets" "public_ids" {
#   filter {
#     name = "tag:Type"
#     values = [ "public" ]
#   }
# }

# data "aws_subnets" "private_ids" {
#   filter {
#     name = "tag:Type"
#     values = [ "private" ]
#   }
# }

# resource "aws_route_table_association" "public_subnet_association" {
#   for_each       = { for subnet in data.aws_subnets.public_ids.ids : subnet => subnet }
#   subnet_id      = each.key
#   route_table_id = aws_route_table.public_route_table.id
#   depends_on     = [aws_route_table.public_route_table, aws_subnet.public]
# }

# resource "aws_route_table_association" "private_subnet_association" {
#   for_each       = { for subnet in data.aws_subnets.private_ids.ids : subnet => subnet }
#   subnet_id      = each.key
#   route_table_id = aws_route_table.private_route_table.id
#   depends_on     = [aws_route_table.private_route_table, aws_subnet.private]
# }

# resource "aws_route_table_association" "private_subnet_association" {
#   depends_on     = [aws_subnet.private]
#   for_each       = { for subnet in aws_subnet.private : subnet.id => subnet }
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.private_route_table.id
# }
