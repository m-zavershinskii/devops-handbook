output "vm_elastic_ip" {
  value       = aws_eip.elastic_ip.public_ip
  description = "VM Public Elastic IP"
}
