resource "aws_vpc" "custom_vpc" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = "${var.vpc_tag_name}-${var.environment}"
  }
}

### VPC Network Setup

# Create the private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = "${aws_vpc.custom_vpc.id}"
  cidr_block = var.private_subnet_cidr_block

  tags = {
    Name = "${var.private_subnet_tag_name}-${var.environment}"
  }
}

# Create the public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = "${aws_vpc.custom_vpc.id}"
  cidr_block = var.public_subnet_cidr_block

  tags = {
    Name = "${var.public_subnet_tag_name}-${var.environment}"
  }
  map_public_ip_on_launch = true
}

# Create IGW for the public subnets
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.custom_vpc.id}"
}

# Route the public subnet traffic through the IGW
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.custom_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.route_table_tag_name}-${var.environment}"
  }
}

resource "aws_route_table_association" "internet_access" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.main.id}"
}