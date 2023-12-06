variable "aws_profile" {
  type = string
  default = "maxizavr"
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
  nullable= false
}

variable "subnet_cidr_block" {
  type = string
  nullable= false
}

variable "instance_type" {
  type = string
  nullable= false
}

variable "instance_private_ip" {
  type = string
  nullable= false
}
