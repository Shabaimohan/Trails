resource "aws_route_table" "route_tables" {
  for_each = var.route_tables

  vpc_id = var.vpc_ids[each.value.vpc_name]

  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}

resource "aws_route_table_association" "associations" {
  for_each = { for idx, route_table in var.route_table_associations : idx => route_table }

  subnet_id      = var.subnet_ids[each.value.subnet_name]
  route_table_id = aws_route_table.route_tables[each.value.route_table_name].id
}
