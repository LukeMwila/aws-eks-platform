# ECR
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id       = "${aws_vpc.custom_vpc.id}"
  service_name = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids          = flatten([["${aws_subnet.private_subnet.id}"], aws_subnet.public_subnet.*.id])

  security_group_ids = [aws_security_group.endpoint_ecr.id]

  tags = {
    Name = "ECR Docker VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id       = "${aws_vpc.custom_vpc.id}"
  service_name = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids          = flatten([["${aws_subnet.private_subnet.id}"], aws_subnet.public_subnet.*.id])

  security_group_ids = [aws_security_group.endpoint_ecr.id]

  tags = {
    Name = "ECR API VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}

# EC2
resource "aws_vpc_endpoint" "ec2" {
  vpc_id       = "${aws_vpc.custom_vpc.id}"
  service_name = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids          = flatten([["${aws_subnet.private_subnet.id}"], aws_subnet.public_subnet.*.id])

  security_group_ids = [aws_security_group.endpoint_ec2.id]

  tags = {
    Name = "EC2 VPC Endpoint Interface - ${var.environment}"
    Environment = var.environment
  }
}

# S3
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = "${aws_vpc.custom_vpc.id}"
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [var.main_pvt_route_table_id]

  tags = {
    Name = "S3 VPC Endpoint Gateway - ${var.environment}"
    Environment = var.environment
  }
}