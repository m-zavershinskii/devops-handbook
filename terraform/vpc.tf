module "us_vpc" {
  source = "./modules/vpc_template"

  vpc_name = "US"
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block

  providers = {
    aws = aws.us
  }
}

module "eu_vpc" {
  source = "./modules/vpc_template"

  vpc_name = "EU"
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block

  providers = {
    aws = aws.eu
  }
}
