# VPC K8s
resource "aws_vpc" "vpc_k8s" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_k8s"
  }
}

# Subnet public 1a
resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.vpc_k8s.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = format("%sa", var.aws_region)
  tags = {
    Name = "public_1a"
  }
}

# Route table association to public 1a
resource "aws_route_table_association" "public_1a_association" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_vpc.vpc_k8s.default_route_table_id
}

# Subnet public 1b
resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.vpc_k8s.id
  cidr_block              = "10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone       = format("%sb", var.aws_region)
  tags = {
    Name = "public_1b"
  }
}

# Route table association to public 1b
resource "aws_route_table_association" "public_1b_association" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_vpc.vpc_k8s.default_route_table_id
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_k8s.id
  tags = {
    Name = "igw"
  }
}

# Route to Internet Access
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.vpc_k8s.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}