output "vpc" {
  value = aws_vpc.this
}

output "private_subnet_ids" {
  value = values(aws_subnet.private_subnet)[*].id
}

output "public_subnet_ids" {
  value = values(aws_subnet.public_subnet)[*].id
}