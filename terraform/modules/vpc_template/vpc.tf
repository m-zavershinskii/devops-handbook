resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  
  tags = {
    Name = "${var.vpc_name} VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name} IGW"
  }
}

resource "aws_route" "public_route" {
  route_table_id = aws_vpc.vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name} Subnet"
  }
}
