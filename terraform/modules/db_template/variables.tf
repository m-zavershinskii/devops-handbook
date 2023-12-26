variable "db_name" {}
variable "db_type" {}
variable "db_version" {}
variable "db_instance_class" {}
variable "db_alloc_storage" {
  type = number
}

variable "db_max_alloc_storage" {
  type = number
  default = 0
}

variable "db_encryption" {
  type = bool
  default = false
}

variable "db_port" {
  type = number
}
variable "db_master_user" {}
variable "db_master_password" {}

variable "db_param_group" {}
variable "db_option_group" {}
variable "db_auto_minor_upgrade" {
  type = bool
}

variable "db_vpc" {}
variable "db_availability_zone" {}
variable "db_security_groups" {
  type = list
}

variable "db_backup_retention_period" {}
variable "db_backup_window" {}
variable "db_maintenance_window" {}
variable "db_multi_az" {
  type = bool
}
variable "db_subnet_group" {}
variable "db_snapshot" {
  default = ""
}
