data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

locals {
  name       = "eks_role"
  account_id = data.aws_caller_identity.current.account_id
  partition  = data.aws_partition.current.partition
}

data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

#resource "aws_iam_role" "instance" {
#  name               = var.eks_role_name
#  path               = var.role_path
#  assume_role_policy = data.aws_iam_policy_document.assume_role_with_oidc.json
#}


resource "aws_iam_role" "eks_cluster_role" {
  name               = "cluster_${local.name}"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}


resource "aws_iam_role_policy_attachment" "eks_cluster_role_attach" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}