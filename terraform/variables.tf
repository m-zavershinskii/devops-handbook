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

variable "subnet_a_cidr_block" {
  type = string
  default = "10.0.1.0/24"
  nullable = false
}

variable "subnet_b_cidr_block" {
  type = string
  default = "10.0.2.0/24"
  nullable = false
}

variable "subnet_c_cidr_block" {
  type = string
  default = "10.0.3.0/24"
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
