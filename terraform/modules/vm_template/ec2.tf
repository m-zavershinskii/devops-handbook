data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_security_group" "instance_sg" {
  name = "${var.vm_name} SG"
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

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.vm_data_volume_device_name
  volume_id   = aws_ebs_volume.data_volume.id
  instance_id = aws_instance.instance.id
}

resource "aws_ebs_volume" "data_volume" {
  availability_zone = var.vm_availability_zone
  size = var.vm_data_volume_size
  type = "gp3"

  tags = {
    Name = "${var.vm_name} Data Volume"
  }
}

resource "aws_instance" "instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.vm_type
  key_name = var.vm_key_pair

  private_ip = var.vm_private_ip
  subnet_id  = var.vm_subnet
  availability_zone = var.vm_availability_zone

  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  root_block_device {
    volume_size = var.vm_root_volume_size
    volume_type = "gp3"
  }

#  user_data = templatefile("./modules/vm_template/cloud-init.yml", { device_name = var.vm_data_volume_device_name })

  tags = {
    Name = "${var.vm_name} Virtual Machine"
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
