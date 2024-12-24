output "vpc_ids" {
  description = "The IDs of all VPCs"
  value = [for key, vpc in aws_vpc.vpcs : vpc.id]
}

output "vpc_cidrs" {
  description = "The CIDR blocks of all VPCs"
  value = [for key, vpc in aws_vpc.vpcs : vpc.cidr_block]
}

output "vpc_tags" {
  description = "The tags for all VPCs"
  value = [for key, vpc in aws_vpc.vpcs : vpc.tags]
}

output "vpc_names" {
  description = "The names of all VPCs"
  value       = [for key, vpc in aws_vpc.vpcs : vpc.tags["Name"]]
}

