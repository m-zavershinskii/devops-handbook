locals {
  aws_us_region = "us-east-1"
  aws_eu_region = "eu-central-1"

  # VPC locals
  vpc_us_cidr_block = "10.0.0.0/16"
  vpc_eu_cidr_block = "10.1.0.0/16"

  subnet_us_a_cidr_block = "10.0.1.0/24"
  subnet_us_b_cidr_block = "10.0.2.0/24"
  subnet_us_c_cidr_block = "10.0.3.0/24"

  subnet_eu_a_cidr_block = "10.1.1.0/24"
  subnet_eu_b_cidr_block = "10.1.2.0/24"
  subnet_eu_c_cidr_block = "10.1.3.0/24"

  anywhere_cidr_block = "0.0.0.0/0"
  anywhere_cidr6_block = "::/0"

  http_port = 80
  https_port = 443
  ssh_port = 22
}
