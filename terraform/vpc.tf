resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr_block
  
  tags = {
    Name = "test vpc"
  }
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test igw"
  }
}

resource "aws_route" "test_public_route" {
  route_table_id = aws_vpc.test_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.test_igw.id

  depends_on = [aws_internet_gateway.test_igw]
}

resource "aws_subnet" "test_subnet" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "test subnet"
  }
}
