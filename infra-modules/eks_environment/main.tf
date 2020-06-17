# VPC for EKS
module "vpc_for_eks" {
  source = "./vpc"
  vpc_tag_name = "${var.platform_name}-vpc"
  private_subnet_tag_name = "${var.platform_name}-private-subnet"
  public_subnet_tag_name = "${var.platform_name}-public-subnet"
  route_table_tag_name = "${var.platform_name}-rt"
  environment = var.environment
}