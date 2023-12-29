resource "aws_iam_group" "this" {
  for_each = var.iam_groups
  name     = each.key
}

