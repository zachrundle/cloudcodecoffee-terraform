# TODO: create a password in AWS Secrets Manager and reference using a data block for the default password
# AWS console acts like a default password already exists (since accounts also have console access enabled)
# because I don't have a default password, the password_reset_required doesn't work as intended

resource "aws_iam_user" "this" {
  for_each = { for user in var.users_and_groups : user.iam_username => user }

  name = each.value.is_service_account == true ? "svc_${each.value.iam_username}" : each.value.iam_username
  path = var.users_path
}

resource "aws_iam_user_login_profile" "this" {
  for_each = { for user in var.users_and_groups : user.iam_username => user }

  user                    = aws_iam_user.this[each.key].name
  password_reset_required = var.password_reset_required
}

resource "aws_iam_user_group_membership" "iam_user_group_memberships" {
  for_each = { for user in var.users_and_groups : user.iam_username => user }

  user   = aws_iam_user.this[each.key].name
  groups = each.value.iam_groups
}