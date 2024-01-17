output "cluster_iam_role_arn" {
  description = "ARN of IAM role"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "cluster_iam_role_name" {
  description = "Name of IAM role"
  value       = aws_iam_role.eks_cluster_role.name
}
