variable "iam_groups" {
  description = "Map of IAM group names and their respective policies"
  type = map(object({
    policies = list(string)
  }))
}



variable "groups_path" {
  description = "Desired path for the IAM group"
  type        = string
  default     = "/group/"
}