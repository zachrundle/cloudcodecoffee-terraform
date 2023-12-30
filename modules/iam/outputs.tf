output "debug_users" {
  value = aws_iam_user.this[*].name
}