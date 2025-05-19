output "vpc_id" {
  value = aws_vpc.main[0].id
  condition = var.create
}

output "public_subnet_id" {
  value = aws_subnet.public[0].id
}

output "private_subnet_id" {
  value = aws_subnet.private[0].id
}

output "public_route_table_id" {
  value = aws_route_table.public[0].id
}

output "private_route_table_id" {
  value = aws_route_table.private[0].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main[0].id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}
