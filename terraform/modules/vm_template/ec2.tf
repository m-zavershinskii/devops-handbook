resource "aws_security_group" "instance_sg" {
  name = "${var.vm_name}_sg"
  description = "Security group for ${var.vm_name}"
  vpc_id = var.vm_vpc

  ingress {
    description = "SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vm_name} SG"
  }
}

resource "aws_instance" "instance" {
  ami = var.vm_ami
  instance_type = var.vm_type
  key_name = var.vm_key_pair

  private_ip = var.vm_private_ip
  subnet_id  = var.vm_subnet

  security_groups = [aws_security_group.instance_sg.id]

  tags = {
    Name = var.vm_name
  }
}

resource "aws_eip" "elastic_ip" {
  domain = "vpc"

  instance = aws_instance.instance.id
  associate_with_private_ip = var.vm_private_ip
  depends_on = [var.vm_internet_gateway]

  tags = {
    Name = "${var.vm_name} Elastic IP"
  }
}
