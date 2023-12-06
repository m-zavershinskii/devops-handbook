output "default_network_acl_id" {
  value       = aws_vpc.test_vpc.default_network_acl_id
  description = "AWS VPC test_vpc default_network_acl_id"
}

output "default_route_table_id" {
  value       = aws_vpc.test_vpc.default_route_table_id
  description = "AWS VPC test_vpc default_route_table_id"
}

output "default_security_group_id" {
  value       = aws_vpc.test_vpc.default_security_group_id
  description = "AWS VPC test_vpc default_security_group_id"
}

output "dhcp_options_id" {
  value       = aws_vpc.test_vpc.dhcp_options_id
  description = "AWS VPC test_vpc dhcp_options_id"
}

output "id" {
  value       = aws_vpc.test_vpc.id
  description = "AWS VPC test_vpc id"
}

output "public_elastic_ip" {
  value       = aws_eip.test_elastic_ip.public_ip
  description = "test instance Public Elastic IP"
}
