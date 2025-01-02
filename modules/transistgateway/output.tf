output "transit_gateway_id" {
  description = "ID of the created Transit Gateway"
  value       = aws_ec2_transit_gateway.tgw.id
}

output "vpc_attachment_ids" {
  description = "IDs of the Transit Gateway VPC attachments"
  value       = { for key, attach in aws_ec2_transit_gateway_vpc_attachment.vpc_attachments : key => attach.id }
}
