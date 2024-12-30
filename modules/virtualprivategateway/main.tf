resource "aws_vpn_gateway" "vpg" {
  for_each = var.vpgs

  vpc_id = var.vpc_ids[each.value.vpc_name]

  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}