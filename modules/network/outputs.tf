output "vpc" {
  value = aws_vpc.this
}

output "private_subnet_ids" {
  value = [for subnet in values(aws_subnet.private_subnet) : subnet.id]
}

output "public_subnet_ids" {
  value = [for subnet in values(aws_subnet.private_subnet) : subnet.id]
}