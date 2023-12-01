output "default_network_acl_id" {
  value       = aws_vpc.example.default_network_acl_id
  description = "AWS VPC example default_network_acl_id"
}

output "default_route_table_id" {
  value       = aws_vpc.example.default_route_table_id
  description = "AWS VPC example default_route_table_id"
}

output "default_security_group_id" {
  value       = aws_vpc.example.default_security_group_id
  description = "AWS VPC example default_security_group_id"
}

output "dhcp_options_id" {
  value       = aws_vpc.example.dhcp_options_id
  description = "AWS VPC example dhcp_options_id"
}

output "id" {
  value       = aws_vpc.example.id
  description = "AWS VPC example id"
}
