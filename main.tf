module "network" {
  source     = "./modules/network"
  name       = var.name
  create_ngw = false
  vpc_cidr   = "10.0.0.0/16"
}

module "iam" {
  source = "./modules/iam"
  user = ["zach", "mav"]
}

