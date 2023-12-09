resource "aws_db_subnet_group" "us_db_subnet_group" {
  provider = aws.us

  name       = "us_db_subnet_group"
  subnet_ids = [module.us_vpc.subnet_a_id, module.us_vpc.subnet_b_id]

  depends_on = [module.us_vpc, module.us_vpc]

  tags = {
    Name = "US DB Subnet Group"
  }
}

resource "aws_db_subnet_group" "eu_db_subnet_group" {
  provider = aws.eu

  name       = "eu_db_subnet_group"
  subnet_ids = [module.eu_vpc.subnet_a_id, module.eu_vpc.subnet_b_id]

  tags = {
    Name = "EU DB Subnet Group"
  }
}

module "online_us_mysql" {
  source = "./modules/db_template"

  db_name = "Online US MySQL"
  db_type = "mysql"
  db_version = "5.7"
  db_instance_class = "db.t3.micro"
  db_alloc_storage = 20
  db_param_group = "default.mysql5.7"
  db_option_group = "default:mysql-5-7"
  db_auto_minor_upgrade = true
  db_port = 3306

  db_vpc = module.us_vpc.vpc_id
  db_subnet_group = aws_db_subnet_group.us_db_subnet_group.id
  db_availability_zone = "${var.aws_us_region}a"
  db_multi_az = false

  db_backup_retention_period = 1
  db_backup_window = "04:00-05:00"
  db_maintenance_window = "Sat:05:30-Sat:06:30"

  providers = {
    aws = aws.us
  }
}

module "online_eu_mysql" {
  source = "./modules/db_template"

  db_name = "Online EU MySQL"
  db_type = "mysql"
  db_version = "5.7"
  db_instance_class = "db.t3.micro"
  db_alloc_storage = 20
  db_param_group = "default.mysql5.7"
  db_option_group = "default:mysql-5-7"
  db_auto_minor_upgrade = true
  db_port = 3306

  db_vpc = module.eu_vpc.vpc_id
  db_subnet_group = aws_db_subnet_group.eu_db_subnet_group.id
  db_availability_zone = "${var.aws_eu_region}a"
  db_multi_az = false

  db_backup_retention_period = 1
  db_backup_window = "04:00-05:00"
  db_maintenance_window = "Sat:05:30-Sat:06:30"

  providers = {
    aws = aws.eu
  }
}
