output "vpc_ids" {
  description = "The IDs of all VPCs created"
  value       = module.vpc.vpc_ids
}

output "vpc_cidrs" {
  description = "The CIDR blocks of all VPCs created"
  value       = module.vpc.vpc_cidrs
}

output "vpc_names" {
  description = "The names of all VPCs created"
  value       = [for tags in module.vpc.vpc_tags : tags["Name"]]
}

output "vpc_environments" {
  description = "The environments of all VPCs created"
  value       = [for tags in module.vpc.vpc_tags : tags["Environment"]]
}

output "vpc_regions" {
  description = "The regions of all VPCs created"
  value       = [for tags in module.vpc.vpc_tags : tags["Region"]]
}

output "subnet_ids" {
  description = "The IDs of all subnets created"
  value       = module.subnet.subnet_ids
}

output "subnet_names" {
  value = module.subnet.subnet_names
}

output "route_table_associations" {
  description = "Mapping of route tables to subnets"
  value = { for key, assoc in module.route_table.route_table_associations : key => {
    subnet_id      = assoc.subnet_id
    route_table_id = assoc.route_table_id
  }}
}


output "vpg_ids" {
  description = "The IDs of all Virtual Private Gateways"
  value       = module.vpg.vpg_ids
}
