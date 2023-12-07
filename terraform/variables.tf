variable "aws_profile" {
  type = string
  description = "An AWS profile to be authorized"
  nullable = false
}

variable "pub_key_file" {
  type = string
  description = "Public key file path"
  nullable = false
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
  nullable = false
}

variable "subnet_cidr_block" {
  type = string
  nullable = false
}

variable "online_us_instance_type" {
  type = string
  nullable = false
}

variable "online_eu_instance_type" {
  type = string
  nullable = false
}

variable "online_us_private_ip" {
  type = string
  nullable = false
}

variable "online_eu_private_ip" {
  type = string
  nullable = false
}

variable "aws_us_region" {
  type = string
  default = "us-east-1"
  nullable = false
}

variable "aws_eu_region" {
  type = string
  default = "eu-central-1"
  nullable = false
}

variable "region_ami_map" {
  type    = map(string)
  default = {
    us-east-1 = "ami-0fc5d935ebf8bc3bc",
    eu-central-1 = "ami-06dd92ecc74fdfb36",
  }
}

