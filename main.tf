module "network" {
  source     = "./modules/network"
  name       = var.name
  create_ngw = false
  vpc_cidr   = "10.0.0.0/16"
}

module "iam_groups" {
  source = "./modules/iam/groups"
  iam_groups = {
    "developers" = {
      policies = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    },
    "devops" = {
      policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
    },
  }
}