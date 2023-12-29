# Separting out the creation if IAM users because of how quickly this will grow
module "iam_users" {
  source = "./modules/iam/users"

  # TODO: Even though defaults are set for the variable users_and_groups, it still requires all values explicitely defined
  users_and_groups = [
    {
      iam_username       = "zrundle"
      iam_groups         = ["devops"]
      is_service_account = false
    },
    {
      iam_username       = "mav"
      iam_groups         = ["developers"]
      is_service_account = false
    },
    {
      iam_username       = "argocd"
      iam_groups         = ["developers"]
      is_service_account = true
    },
  ]
}

