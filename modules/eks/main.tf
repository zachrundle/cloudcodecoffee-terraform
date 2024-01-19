resource "aws_eks_cluster" "example" {
  name     = var.name
  role_arn = var.role_arn
  version = var.cluster_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}