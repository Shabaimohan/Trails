# output "route_table_ids" {
#   description = "The IDs of all route tables"
#   value       = { for key, route_table in aws_route_table.route_tables : key => route_table.id }
# }

# output "route_table_associations" {
#   description = "The associations of route tables to subnets"
#   value       = aws_route_table_association.associations
# }

output "route_table_ids" {
  description = "The IDs of all route tables"
  value       = { for key, route_table in aws_route_table.route_tables : key => route_table.id }
}

output "route_table_associations" {
  description = "The associations of route tables to subnets"
  value       = { for key, assoc in aws_route_table_association.associations : key => {
    subnet_id      = assoc.subnet_id
    route_table_id = assoc.route_table_id
  }}
}

