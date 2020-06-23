# VPC for EKS
module "vpc_for_eks" {
  source = "./vpc"
  eks_cluster_name = var.eks_cluster_name
  vpc_tag_name = "${var.platform_name}-vpc"
  route_table_tag_name = "${var.platform_name}-rt"
  environment = var.environment
}

# EKS Cluster
module "eks_cluster_and_worker_nodes" {
  source = "./eks_cluster"
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_subnet_ids = var.eks_cluster_subnets
  endpoint_private_access = true
  endpoint_public_access = true
  environment = var.environment
}