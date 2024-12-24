variable "vpc_ids" {
  description = "Map of VPC IDs keyed by VPC name"
  type        = map(string)
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

# variable "subnet_names" {
#   description = "Map of subnet names keyed by VPC name"
#   type        = map(string)
# }

variable "subnet_vpc_map" {
  description = "Mapping of subnets to their parent VPCs"
  type        = map(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "az_map" {
  description = "Mapping of subnets to their availability zones"
  type        = map(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "subnet_names" {
  description = "Mapping of subnet names keyed by subnet keys"
  type        = map(string)
  
}
