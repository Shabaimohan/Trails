variable "vpc_ids" {
  description = "Map of VPC IDs keyed by VPC name"
  type        = map(string)
}

variable "subnet_ids" {
  description = "Map of Subnet IDs keyed by Subnet name"
  type        = map(string)
}

variable "route_tables" {
  description = "Map of route table definitions keyed by route table name"
  type = map(object({
    name     = string
    vpc_name = string
  }))
}

variable "route_table_associations" {
  description = "List of route table associations keyed by index"
  type = map(object({
    route_table_name = string
    subnet_name      = string
  }))
}

variable "environment" {
  description = "Environment name"
  type        = string
}