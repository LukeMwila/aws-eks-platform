# VPC for EKS
module "vpc_for_eks" {
  source = "./vpc"
  eks_cluster_name = var.eks_cluster_name
  vpc_tag_name = "${var.platform_name}-vpc"
  route_table_tag_name = "${var.platform_name}-rt"
  main_pvt_route_table_id = var.main_pvt_route_table_id
  region = var.region
  environment = var.environment
}

# EKS Cluster
module "eks_cluster_and_worker_nodes" {
  source = "./eks_cluster"
  # Cluster
  vpc_id = module.vpc_for_eks.vpc_id
  cluster_sg_name = "${var.platform_name}-cluster-sg"
  nodes_sg_name = "${var.platform_name}-node-sg"
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_subnet_ids = var.eks_cluster_subnets # module.vpc_for_eks.public_subnet_ids
  pvt_desired_size = 3
  pvt_max_size = 8
  pvt_min_size = 2
  pblc_desired_size = 1
  pblc_max_size = 2
  pblc_min_size = 1
  endpoint_private_access = true
  endpoint_public_access = true
  # Node group
  node_group_name = "${var.eks_cluster_name}-node-group"
  private_subnet_ids = [module.vpc_for_eks.private_subnet_id]
  public_subnet_ids = module.vpc_for_eks.public_subnet_ids
  environment = var.environment
}