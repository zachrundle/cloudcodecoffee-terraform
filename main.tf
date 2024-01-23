module "network" {
  source     = "./modules/network"
  name       = var.name
  create_ngw = false
  vpc_cidr   = "10.0.0.0/16"
}

module "iam_roles" {
  source        = "./modules/iam/roles"
  eks_role_name = "${var.name}_eks_cluster_role"
}

module "iam_groups" {
  source = "./modules/iam/groups"
  iam_groups = {
    "developers" = {
      policies = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess",
      ]
    },
    "devops" = {
      policies = [
        "arn:aws:iam::aws:policy/AdministratorAccess",
      ]
    },
    "serviceaccounts" = {
      policies = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess",
      ]
    },
  }
}

module "eks" {
  source = "./modules/eks"
  create_eks_cluster = false
  name = var.name
  role_arn = module.iam_roles.cluster_iam_role_arn
  cluster_version = 1.27
  subnet_ids = module.network.private_subnet_ids
}

