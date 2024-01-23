variable "role_path" {
  description = "Path used for roles"
  type        = string
  default     = "/system/"
}

variable "eks_role_name" {
  description = "Name of the role that EKS will use to manage resources"
  type        = string
}