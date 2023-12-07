resource "aws_key_pair" "us_key" {
  provider = aws.us

  key_name   = "us-key"
  public_key = file(var.pub_key_file)

  tags = {
    Name = "us key"
  }
}

resource "aws_key_pair" "eu_key" {
  provider = aws.eu

  key_name   = "eu-key"
  public_key = file(var.pub_key_file)

  tags = {
    Name = "eu key"
  }
}

module "online_us_vm" {
  source = "./modules/vm_template"

  vm_name = "online_us"
  vm_ami = var.region_ami_map[var.aws_us_region]
  vm_type = var.online_us_instance_type
  vm_key_pair = aws_key_pair.us_key.id

  vm_vpc = module.us_vpc.vpc_id
  vm_subnet = module.us_vpc.subnet_id
  vm_internet_gateway = module.us_vpc.igw_id
  vm_private_ip = var.online_us_private_ip

  providers = {
    aws = aws.us
  }
}

module "online_eu_vm" {
  source = "./modules/vm_template"

  vm_name = "online_eu"
  vm_ami = var.region_ami_map[var.aws_eu_region]
  vm_type = var.online_eu_instance_type
  vm_key_pair = aws_key_pair.eu_key.id

  vm_vpc = module.eu_vpc.vpc_id
  vm_subnet = module.eu_vpc.subnet_id
  vm_internet_gateway = module.eu_vpc.igw_id
  vm_private_ip = var.online_eu_private_ip

  providers = {
    aws = aws.eu
  }
}
