resource "aws_eks_cluster" "this" {
  count = var.create_eks_cluster ? 1 : 0
  name     = var.name
  role_arn = var.role_arn
  version = var.cluster_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}