variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "private_subnet_tag_name" {
  type        = string
  description = "Name tag for the private subnet"
}

variable "public_subnet_tag_name" {
  type        = string
  description = "Name tag for the private subnet"
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

variable "public_subnet_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block range for the public subnet"
}

variable "environment" {
  type        = string
  description = "Application enviroment"
}