

output "subnet_ids" {
  description = "The IDs of all subnets"
  value       = { for key, subnet in aws_subnet.subnets : var.subnet_names[key] => subnet.id }
}

output "subnet_cidrs" {
  description = "The CIDR blocks of all subnets"
  value       = { for key, subnet in aws_subnet.subnets : key => subnet.cidr_block }
}

output "subnet_names" {
  description = "The names of all subnets"
  value       = { for key, subnet in aws_subnet.subnets : key => subnet.tags["Name"] }
}

