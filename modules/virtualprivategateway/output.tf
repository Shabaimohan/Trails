output "vpg_ids" {
  description = "The IDs of all created Virtual Private Gateways"
  value       = { for key, vpg in aws_vpn_gateway.vpg : key => vpg.id }
}