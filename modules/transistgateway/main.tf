# Transit Gateway
resource "aws_ec2_transit_gateway" "tgw" {
  description         = var.description
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

# VPC Attachments
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachments" {
  for_each = var.vpc_attachments

  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = var.vpc_ids[each.value.vpc_name]
  subnet_ids         = [for subnet in each.value.subnet_names : var.subnet_ids[subnet]]

  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}
