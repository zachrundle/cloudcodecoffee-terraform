# TODO: find a better way for password management, as this is not a realistic solution
# After some thought, creating manual IAM user accounts is not a good solution, instead will look at exploring this
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers.html

resource "aws_iam_account_password_policy" "this" {
  minimum_password_length = 12
  require_lowercase_characters = true
  require_uppercase_characters = true
  require_numbers = true
  require_symbols = true
}


resource "aws_iam_user" "this" {
  for_each = { for user in var.users_and_groups : user.iam_username => user }

  name = each.value.is_service_account == true ? "svc_${each.value.iam_username}" : each.value.iam_username
  path = var.users_path
}

resource "aws_iam_user_login_profile" "this" {
  for_each = { for user in var.users_and_groups : user.iam_username => user if !user.is_service_account}

  user                    = aws_iam_user.this[each.key].name
  password_reset_required = var.password_reset_required
  password_length         = 20
}

resource "aws_iam_access_key" "this" {
  for_each = { for user in var.users_and_groups : user.iam_username => user }
  user       = each.value.is_service_account == true ? "svc_${each.key}" : each.key
  depends_on = [aws_iam_user.this]
}

resource "aws_iam_user_group_membership" "this" {
  for_each = { for user in var.users_and_groups : user.iam_username => user }

  user   = aws_iam_user.this[each.key].name
  groups = each.value.iam_groups
}

