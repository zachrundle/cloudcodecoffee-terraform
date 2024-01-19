variable "role_arn" {
    description = "ARN of the IAM role that EKS cluster will use"
    type = string
}

variable "name" {
    description = "Name of the EKS cluster"
    type = string
}

variable "cluster_version" {
    description = "Kubernetes cluster version in the format of <major>.<minor>"
    type = number
}

variable "subnet_ids" {
    description = "Subnets where EKS cluster will be provisioned"
    type = list(string)
}

