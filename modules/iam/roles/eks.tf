data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

locals {
  name       = "eks_role"
  account_id = data.aws_caller_identity.current.account_id
  partition  = data.aws_partition.current.partition
}

resource "aws_iam_role" "instance" {
  name               = local.name
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.assume_role_with_oidc.json
}

