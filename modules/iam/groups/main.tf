locals {
    group_lists = flatten([
        for group_key, details in var.iam_groups : [
            for policy_key, policy_arn in details.policies : {
                group_key = group_key
                policy_key = policy_key
                group = aws_iam_group.this[group_key].name
                policy_arn = policy_arn

            }
        ]
    ])
}

resource "aws_iam_group" "this" {
  for_each = var.iam_groups
  name     = each.key
}

resource "aws_iam_group_policy_attachment" "this" {
  for_each = {
    for group in local.group_lists : "${group.group_key}" => group
  }

  group = each.value.group
  policy_arn = each.value.policy_arn
}