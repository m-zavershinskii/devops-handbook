resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  #default = true
  tags = {
    Name = "example vpc"
  }
}
