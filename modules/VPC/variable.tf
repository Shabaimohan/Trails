variable "aws_region" {
  # description = "The AWS region to create the VPCs in"
  # type        = string
  # default     = "us-east-1"
}

variable "vpc_cidrs" {
  # description = "List of CIDR blocks for the VPCs"
  # type        = list(string)
  # default     = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}

variable "vpc_dns" {
  # description = "List of CIDR blocks for the VPCs"
  # type        = string
  # default     = "true"
}

variable "vpc_names" {
  # description = "List of names for the VPCs"
  # type        = list(string)
  # default     = ["APP", "WEB", "DB"]
}

variable "vpc_environments" {
#   description = "List of environments for the VPCs"
#   type        = string
#   default     = "Development"
}

variable "vpc_region" {
  # description = "List of environments for the VPCs"
  # type        = string
  # default     = "us-east-1"
}