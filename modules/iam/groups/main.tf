# FIX - only 1 IAM policy is being tied to a group (because of the [0] reference. I tried this with [*] and just
# each.value.group but this did not work)

resource "aws_iam_group" "this" {
  for_each = var.iam_groups
  name     = each.key
}

resource "aws_iam_group_policy_attachment" "this" {
  for_each = { for group, details in var.iam_groups : group => flatten([for policy in details.policies : { group = group, policy_arn = policy }]) }

  group      = aws_iam_group.this[each.value[0].group].name
  policy_arn = each.value[0].policy_arn
}