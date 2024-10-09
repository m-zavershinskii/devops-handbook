variable "vm_ami" {
  type = string
  default = ""
}
variable "vm_name" {}
variable "vm_vpc" {}
variable "vm_type" {}
variable "vm_key_pair" {}
variable "vm_private_ip" {}
variable "vm_public_ip" {
  type = string
  default = ""
}
variable "vm_subnet" {}
variable "vm_internet_gateway" {}
variable "vm_root_volume_size" {}
variable "vm_root_volume_deletion" {
  type = bool
  default = false
}
variable "vm_data_volume_size" {
  default = null
}
variable "vm_availability_zone" {}
variable "vm_data_volume_device_name" {
  default = null
}

variable "vm_security_groups" {
  type = list
}
