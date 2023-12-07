module "us_vpc" {
  source = "./modules/vpc_template"

  vpc_name = "US"
  aws_region = var.aws_us_region
  vpc_cidr_block = var.vpc_cidr_block
  subnet_a_cidr_block = var.subnet_a_cidr_block
  subnet_b_cidr_block = var.subnet_b_cidr_block
  subnet_c_cidr_block = var.subnet_c_cidr_block

  providers = {
    aws = aws.us
  }
}

module "eu_vpc" {
  source = "./modules/vpc_template"

  vpc_name = "EU"
  aws_region = var.aws_eu_region
  vpc_cidr_block = var.vpc_cidr_block
  subnet_a_cidr_block = var.subnet_a_cidr_block
  subnet_b_cidr_block = var.subnet_b_cidr_block
  subnet_c_cidr_block = var.subnet_c_cidr_block

  providers = {
    aws = aws.eu
  }
}
