# TODO - add in users from Silicon Valley TV show (Gilfoyle, Dinesh, Richard, Jared)
# Gilfoyle = networking engineer, Dinish = developer, Richard = architect, Jared = billing

module "iam_users" {
  source = "./modules/iam/users"

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

