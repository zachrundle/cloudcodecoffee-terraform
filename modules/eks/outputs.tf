output "cluster_arn" {
  value = [for cluster in aws_eks_cluster.this : cluster.arn]
}

output "cluster_id" {
  value = [for cluster in aws_eks_cluster.this : cluster.id]
}

output "cluster_creation_time" {
  value = [for cluster in aws_eks_cluster.this : cluster.created_at]
}

output "cluster_k8s_version" {
  value = [for cluster in aws_eks_cluster.this : cluster.platform_version]
}

output "cluster_endpoint" {
  value = [for cluster in aws_eks_cluster.this : cluster.endpoint]
}

output "cluster_status" {
  value = [for cluster in aws_eks_cluster.this : cluster.status]
}