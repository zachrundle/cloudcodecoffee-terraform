resource "aws_iam_user" "this" {
  for_each =   { for name in var.user : name => name }
  name = each.value
  path = var.path
}

resource "aws_iam_user_login_profile" "this" {
  for_each =   { for name in var.user : name => name }
  user                    = aws_iam_user.this[each.value].name
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
}