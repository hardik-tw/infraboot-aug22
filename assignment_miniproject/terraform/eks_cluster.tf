resource "aws_eks_cluster" "kanban" {
  name     = "kanban-cluster"
  role_arn = aws_iam_role.kanban_iam.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }


  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  
  depends_on = [
    aws_iam_role_policy_attachment.kanban_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.kanban_AmazonEKSVPCResourceController,
  ]
}


resource "aws_eks_node_group" "kanban_nodeg" {
  cluster_name    = aws_eks_cluster.kanban.name
  node_group_name = "kanban-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.kanban_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.kanban_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.kanban_AmazonEC2ContainerRegistryReadOnly,
  ]
}