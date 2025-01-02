variable "name" {
  description = "Name of the Transit Gateway"
  type        = string
}

variable "description" {
  description = "Description of the Transit Gateway"
  type        = string
  default     = "Transit Gateway for connecting VPCs"
}

variable "auto_accept_shared_attachments" {
  description = "Whether to automatically accept cross-account attachments"
  type        = string
  default     = "enable"
}

variable "default_route_table_association" {
  description = "Whether to associate by default"
  type        = string
  default     = "enable"
}

variable "default_route_table_propagation" {
  description = "Whether to propagate by default"
  type        = string
  default     = "enable"
}

variable "vpc_attachments" {
  description = "Map of VPC attachments"
  type = map(object({
    name         = string
    vpc_name     = string
    subnet_names = list(string)
  }))
}

variable "vpc_ids" {
  description = "Map of VPC IDs keyed by VPC name"
  type        = map(string)
}

variable "subnet_ids" {
  description = "Map of Subnet IDs keyed by Subnet name"
  type        = map(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}
