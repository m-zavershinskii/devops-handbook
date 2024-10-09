resource "aws_security_group" "ssh_eu_sg" {
  provider = aws.eu

  name = "SSH"
  description = "SSH"
  vpc_id = module.eu_vpc.vpc_id

  ingress {
    description = "SSH"
    from_port = local.ssh_port
    to_port = local.ssh_port
    protocol = "tcp"
    cidr_blocks = [local.vpc_us_cidr_block,local.vpc_eu_cidr_block,local.anywhere_cidr_block]
  }
}

resource "aws_security_group" "web_eu_sg" {
  provider = aws.eu

  name = "HTTP/HTTPS"
  description = "HTTPS/HTTPS"
  vpc_id = module.eu_vpc.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port = local.http_port
    to_port = local.http_port
    protocol = "tcp"
    cidr_blocks = [local.anywhere_cidr_block]
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port = local.https_port
    to_port = local.https_port
    protocol = "tcp"
    cidr_blocks = [local.anywhere_cidr_block]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port = local.http_port
    to_port = local.http_port
    protocol = "tcp"
    ipv6_cidr_blocks = [local.anywhere_cidr6_block]
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port = local.https_port
    to_port = local.https_port
    protocol = "tcp"
    ipv6_cidr_blocks = [local.anywhere_cidr6_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }
}
