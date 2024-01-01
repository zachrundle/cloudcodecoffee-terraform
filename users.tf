# Separting out the creation if IAM users because of how quickly this will grow
module "iam_users" {
  source = "./modules/iam/users"

  # TODO: Even though defaults are set for the variable users_and_groups, it still requires all values explicitely defined
  # if is_service_account = true, it will prefix the iam username with "svc_" to easily track resources
  # TODO: explore using tags for account_type: user/service
  # The process of setting the initial user password will be done by the sysadmin
  # The process of generating API keys should be done by the user once default password has been changed

  users_and_groups = {
    "Zach Rundle" = {
      iam_username = "zrundle"
      iam_groups   = ["devops", "developers"]
    },

    "Maverick the Dog" = {
      iam_username = "mav"
      iam_groups   = ["developers"]
    },

    "Argo CD" = {
      iam_username       = "argocd"
      iam_groups         = ["serviceaccounts"]
      is_service_account = true
    },
  }
}

