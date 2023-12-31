variable "users_path" {
  description = "Desired path for the IAM user"
  type        = string
  default     = "/users/"
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = true
}

variable "users_and_groups" {
  description = "Map of objects defining IAM users and their groups"
  type = map(object({
    iam_username       = string
    iam_groups         = set(string)
    is_service_account = optional(bool, false)
  }))
}
