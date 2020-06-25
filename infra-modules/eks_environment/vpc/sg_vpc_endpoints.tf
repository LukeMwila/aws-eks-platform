# EC2 VPC Endpoint security groups
resource "aws_security_group" "endpoint_ec2" {
  name   = "endpoint-ec2-sg"
  vpc_id = aws_vpc.custom_vpc.id
}

resource "aws_security_group_rule" "endpoint_ec2_443" {
  security_group_id = aws_security_group.endpoint_ec2.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = flatten([[var.private_subnet_cidr_block], var.public_subnet_cidr_blocks])
}

# ECR VPC Endpoint security groups
resource "aws_security_group" "endpoint_ecr" {
  name   = "endpoint-ecr-sg"
  vpc_id = aws_vpc.custom_vpc.id
}

resource "aws_security_group_rule" "endpoint_ecr_443" {
  security_group_id = aws_security_group.endpoint_ecr.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = flatten([[var.private_subnet_cidr_block], var.public_subnet_cidr_blocks])
}