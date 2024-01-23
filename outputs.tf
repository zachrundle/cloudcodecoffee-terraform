output "iam_temp_passwords" {
  value = {
    user_id = module.iam_users.user_id 
    password = module.iam_users.password
  }
}

output "public_subnets" {
    value = module.network.public_subnet_ids
}

output "private_subnets" {
    value = module.network.private_subnet_ids
}