output "online_us_elastic_ip" {
  value = module.online_us_vm.vm_elastic_ip
  description = "Online US instance Public Elastic IP"
}

output "online_eu_elastic_ip" {
  value = module.online_eu_vm.vm_elastic_ip
  description = "Online EU instance Public Elastic IP"
}
