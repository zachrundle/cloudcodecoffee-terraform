variable "user" {
   description = "list of IAM users to create"
   type = list(string)
   default = [] 
}

variable "path" {
    description = "Desired path for the IAM user"
    type = string
    default = "/"
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = true
}

variable "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 20
}
