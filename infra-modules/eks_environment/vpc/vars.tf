variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "route_table_tag_name" {
  type        = string
  default     = "main"
  description = "Route table description"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_block" {
  type        = string
  default     = "10.0.0.0/24"
  description = "CIDR block range for the private subnet"
}

variable "public_subnet_cidr_blocks" {
  type = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDR block range for the public subnet"
}

variable "environment" {
  type        = string
  description = "Application enviroment"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type = string
}

variable "availability_zones" {
  type  = list(string)
  default = ["eu-west-1b", "eu-west-1c"]
  description = "List of availability zones for the selected region"
}

variable "main_pvt_route_table_id" {
  description = "Main Rroute table id for VPC with EKS cluster"
  type = string
}

variable "region" {
  description = "aws region to deploy to"
  type        = string
}