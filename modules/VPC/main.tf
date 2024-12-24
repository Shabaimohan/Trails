resource "aws_vpc" "vpcs" {
  for_each = tomap({
    for index, cidr in var.vpc_cidrs :
    "vpc_${index}" => {
      cidr_block  = cidr
      name        = var.vpc_names[index]
      environment = var.vpc_environments
      region = var.vpc_region
    }
  })

  cidr_block       = each.value.cidr_block
  enable_dns_support   = var.vpc_dns

  tags = {
    Name        = each.value.name
    Environment = each.value.environment
    Region = each.value.region

  }
}

