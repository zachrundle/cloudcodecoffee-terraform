output "password" {
  value = [for user in values(aws_iam_user_login_profile.this) : user.password]
}

output "user_id" {
  value = [for user in values(aws_iam_user_login_profile.this) : user.id]
}