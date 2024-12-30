variable "vpc_ids" {
  description = "Map of VPC IDs keyed by VPC name"
  type        = map(string)
}

variable "vpgs" {
  description = "Map of Virtual Private Gateways keyed by name"
  type = map(object({
    name     = string
    vpc_name = string
  }))
}

variable "environment" {
  description = "Environment name"
  type        = string
}