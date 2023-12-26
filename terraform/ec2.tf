resource "aws_key_pair" "us_key" {
  provider = aws.us

  key_name   = "Ubuntu SSH key"
  public_key = file(var.pub_key_file)
}

resource "aws_key_pair" "eu_key" {
  provider = aws.eu

  key_name   = "Ubuntu SSH key"
  public_key = file(var.pub_key_file)
}

#module "sandbox1_vm" {
#  source = "./modules/vm_template"
#
#  vm_name = "Sandbox1"
#  vm_type = "t3a.micro"
#  vm_key_pair = aws_key_pair.eu_key.id
#
#  vm_vpc = module.eu_vpc.vpc_id
#  vm_internet_gateway = module.eu_vpc.igw_id
#
#  vm_subnet = module.eu_vpc.subnet_a_id
#  vm_private_ip = "10.1.1.11"
#  vm_availability_zone = "${local.aws_eu_region}a"
#  vm_security_groups = [
#    aws_security_group.web_eu_sg.id,
#    aws_security_group.ssh_eu_sg.id
#  ]
#
#  vm_root_volume_size = 20
#  #vm_data_volume_size = 15
#  #vm_data_volume_device_name = "/dev/sdf"
#
#  providers = {
#    aws = aws.eu
#  }
#}
#
#module "sandbox2_vm" {
#  source = "./modules/vm_template"
#
#  vm_name = "Sandbox2"
#  vm_type = "t3a.micro"
#  vm_key_pair = aws_key_pair.eu_key.id
#
#  vm_vpc = module.eu_vpc.vpc_id
#  vm_internet_gateway = module.eu_vpc.igw_id
#
#  vm_subnet = module.eu_vpc.subnet_a_id
#  vm_private_ip = "10.1.1.12"
#  vm_availability_zone = "${local.aws_eu_region}a"
#  vm_security_groups = [
#    aws_security_group.web_eu_sg.id,
#    aws_security_group.ssh_eu_sg.id
#  ]
#
#  vm_root_volume_size = 20
#  #vm_data_volume_size = 15
#  #vm_data_volume_device_name = "/dev/sdf"
#
#  providers = {
#    aws = aws.eu
#  }
#}
