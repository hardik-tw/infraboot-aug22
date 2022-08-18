output "endpoint" {
  value = aws_eks_cluster.kanban.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.kanban.certificate_authority[0].data
}