resource "aws_subnet" "subnets" {
  for_each = { for idx, cidr in var.subnet_cidrs : "subnet_${idx}" => cidr }

  vpc_id                  = var.vpc_ids[var.subnet_vpc_map[each.key]]
  cidr_block              = each.value
  availability_zone       = var.availability_zones[lookup(var.az_map, each.key)]
  map_public_ip_on_launch = false

  tags = {
    Name        = var.subnet_names[each.key]
    Environment = var.environment
    VPC         = var.subnet_vpc_map[each.key]
  }
}
