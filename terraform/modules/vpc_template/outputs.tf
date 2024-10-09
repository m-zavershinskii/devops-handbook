output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_a_id" {
  value = aws_subnet.subnet_a.id
}

output "subnet_b_id" {
  value = aws_subnet.subnet_b.id
}

output "subnet_c_id" {
  value = aws_subnet.subnet_c.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "rtb_id" {
  value = aws_vpc.vpc.default_route_table_id
}
