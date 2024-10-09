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
