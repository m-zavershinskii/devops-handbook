resource "aws_key_pair" "us_key" {
  provider = aws.us

  key_name   = "US SSH key"
  public_key = file(var.pub_key_file)

  tags = {
    Name = "US SSH Key"
  }
}

resource "aws_key_pair" "eu_key" {
  provider = aws.eu

  key_name   = "EU SSH key"
  public_key = file(var.pub_key_file)

  tags = {
    Name = "EU SSH key"
  }
}

module "online_us_vm" {
  source = "./modules/vm_template"

  vm_name = "Online US"
  vm_type = "t3.micro"
  vm_key_pair = aws_key_pair.us_key.id

  vm_vpc = module.us_vpc.vpc_id
  vm_internet_gateway = module.us_vpc.igw_id

  vm_subnet = module.us_vpc.subnet_a_id
  vm_private_ip = "10.0.1.10"
  vm_availability_zone = "${var.aws_us_region}a"

  vm_root_volume_size = 10
  vm_data_volume_size = 15
  vm_data_volume_device_name = "/dev/sdf"

  providers = {
    aws = aws.us
  }
}

module "online_eu_vm" {
  source = "./modules/vm_template"

  vm_name = "Online EU"
  vm_type = "t3.micro"
  vm_key_pair = aws_key_pair.eu_key.id

  vm_vpc = module.eu_vpc.vpc_id
  vm_internet_gateway = module.eu_vpc.igw_id

  vm_subnet = module.eu_vpc.subnet_a_id
  vm_private_ip = "10.0.1.10"
  vm_availability_zone = "${var.aws_eu_region}a"

  vm_root_volume_size = 10
  vm_data_volume_size = 15
  vm_data_volume_device_name = "/dev/sdf"

  providers = {
    aws = aws.eu
  }
}
