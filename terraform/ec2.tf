resource "aws_key_pair" "test_key" {
  key_name   = "test-key"
  public_key = file(var.pub_key_file)
  tags = {
    Name = "test key"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description      = "SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow ssh"
  }
}

resource "aws_instance" "test_instance" {
  ami           = "ami-06dd92ecc74fdfb36"
  instance_type = var.instance_type
  key_name = aws_key_pair.test_key.id

  private_ip = var.instance_private_ip
  subnet_id  = aws_subnet.test_subnet.id

  security_groups = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "test instance"
  }
}

resource "aws_eip" "test_elastic_ip" {
  domain = "vpc"

  instance                  = aws_instance.test_instance.id
  associate_with_private_ip = var.instance_private_ip
  depends_on                = [aws_internet_gateway.test_igw]

  tags = {
    Name = "test elastic ip"
  }
}
