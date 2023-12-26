output "vm_elastic_ip" {
  value       = var.vm_public_ip != "" ? var.vm_public_ip : aws_eip.elastic_ip[0].public_ip
  description = "VM Public Elastic IP"
}
