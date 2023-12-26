module "us_vpc" {
  source = "./modules/vpc_template"

  vpc_name = "US"
  aws_region = local.aws_us_region
  vpc_cidr_block = local.vpc_us_cidr_block
  subnet_a_cidr_block = local.subnet_us_a_cidr_block
  subnet_b_cidr_block = local.subnet_us_b_cidr_block
  subnet_c_cidr_block = local.subnet_us_c_cidr_block

  providers = {
    aws = aws.us
  }
}

module "eu_vpc" {
  source = "./modules/vpc_template"

  vpc_name = "EU"
  aws_region = local.aws_eu_region
  vpc_cidr_block = local.vpc_eu_cidr_block
  subnet_a_cidr_block = local.subnet_eu_a_cidr_block
  subnet_b_cidr_block = local.subnet_eu_b_cidr_block
  subnet_c_cidr_block = local.subnet_eu_c_cidr_block

  providers = {
    aws = aws.eu
  }
}
