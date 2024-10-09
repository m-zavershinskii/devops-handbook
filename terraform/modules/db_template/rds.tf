#resource "aws_security_group" "instance_sg" {
#  name = "${var.db_name} SG"
#  description = "Security group for ${var.db_name}"
#  vpc_id = var.db_vpc
#
#  ingress {
#    description = "MySQL connect from anywhere"
#    from_port = var.db_port
#    to_port = var.db_port
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port = 0
#    to_port = 0
#    protocol = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  tags = {
#    Name = "${var.db_name} SG"
#  }
#}

resource "aws_db_instance" "instance" {
  allocated_storage = var.db_snapshot != "" ? null : var.db_alloc_storage
  max_allocated_storage = var.db_max_alloc_storage
  identifier = lower(replace(var.db_name, " ", "-"))
  #db_name = lower(replace(var.db_name, " ", "_"))
  engine = var.db_snapshot != "" ? null : var.db_type
  engine_version = var.db_version
  instance_class = var.db_instance_class
  parameter_group_name = var.db_param_group
  auto_minor_version_upgrade = var.db_auto_minor_upgrade

  snapshot_identifier = var.db_snapshot != "" ? var.db_snapshot : null
  db_subnet_group_name = var.db_subnet_group
  availability_zone = var.db_availability_zone
  multi_az = var.db_multi_az
  network_type = "IPV4"
  publicly_accessible = true
  #vpc_security_group_ids = [aws_security_group.instance_sg.id]
  vpc_security_group_ids = var.db_security_groups
  port = var.db_port

  storage_type = "gp3"
  storage_encrypted = var.db_encryption

  username = var.db_snapshot != "" ? null: var.db_master_user
  password = var.db_snapshot != "" ? null : var.db_master_password

  backup_retention_period = var.db_backup_retention_period
  backup_window = var.db_backup_window # 09:46-10:16
  maintenance_window = var.db_maintenance_window # Mon:00:00-Mon:03:00

  skip_final_snapshot = true
  allow_major_version_upgrade = false
  copy_tags_to_snapshot = true
  deletion_protection = true
  ca_cert_identifier = "rds-ca-rsa2048-g1"

  tags = {
    Name = "${var.db_name} Database"
  }

  timeouts {
    create = "6h"
    delete = "3h"
    update = "3h"
  }
}
