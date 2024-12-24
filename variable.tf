variable "vpc_cidrs" {
  description = "List of CIDR blocks for the VPCs"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}

variable "vpc_names" {
  description = "List of names for the VPCs"
  type        = list(string)
  default     = ["APP", "WEB", "DB"]
}

variable "vpc_environments" {
  description = "List of environments for the VPCs"
  type        = string
  default     = "Development"
}

variable "vpc_region" {
  description = "List of environments for the VPCs"
  type        = string
  default     = "us-east-1"
}

variable "vpc_dns" {
  description = "List of CIDR blocks for the VPCs"
  type        = bool
  default     = "true"
}

# variable "vpc_ids" {
#   description = "List of VPC IDs"
#   type        = list(string)
# }

# variable "vpc_cidrs" {
#   description = "List of VPC CIDR blocks"
#   type        = list(string)
# }

# variable "vpc_names" {
#   description = "List of VPC names"
#   type        = list(string)
# }

# variable "vpc_ids" {
#   description = "Map of VPC IDs with their names"
#   # type        = map(string)
#   # default     = {
#   #   WEB = module.vpc.vpc_ids[0]
#   #   APP = module.vpc.vpc_ids[1]
#   #   DB  = module.vpc.vpc_ids[2]
#   # }
# }

# variable "subnet_cidrs" {
#   description = "Map of VPC names to lists of subnet CIDR blocks"
#   type        = map(list(string))
#   default     = {
#     WEB = [
#       "10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", 
#       "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"
#     ]
#     APP = [
#       "10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24",
#       "10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24"
#     ]
#     DB = [
#       "10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/24",
#       "10.2.3.0/24", "10.2.4.0/24", "10.2.5.0/24"
#     ]
#   }
# }

# data "aws_vpc" "web" {
#   filter {
#     name   = "tag:Name" # Filter based on the "Name" tag
#     values = ["WEB"]
#   }
# }

# data "aws_vpc" "app" {
#   filter {
#     name   = "tag:Name"
#     values = ["APP"]
#   }
# }

# data "aws_vpc" "db" {
#   filter {
#     name   = "tag:Name"
#     values = ["DB"]
#   }
# }

# # Create the VPC IDs map dynamically
# locals {
#   vpc_ids = {
#     WEB = data.aws_vpc.web.id
#     APP = data.aws_vpc.app.id
#     DB  = data.aws_vpc.db.id
#   }
# }

# variable "subnet_vpc_ids" {
#    description = "Map of VPC IDs keyed by VPC name"
#    type        = map(string)
#     default = { APP = module.vpc.vpc_ids[0], WEB = module.vpc.vpc_ids[1], DB = module.vpc.vpc_ids[2] }
#  }

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24",
                 "10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24",
                 "10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24", "10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"]
}

variable "subnet_names" {
  description = "Map of subnet names keyed by VPC name"
  type        = map(string)
  default     = {
    subnet_0  = "app-subnet-1", subnet_1  = "app-subnet-2", subnet_2  = "app-subnet-3", subnet_3  = "app-subnet-4", subnet_4  = "app-subnet-5",  subnet_5  = "app-subnet-6",
    subnet_6  = "web-subnet-1", subnet_7  = "web-subnet-2", subnet_8  = "web-subnet-3", subnet_9  = "web-subnet-4", subnet_10 = "web-subnet-5", subnet_11 = "web-subnet-6",
    subnet_12 = "db-subnet-1", subnet_13 = "db-subnet-2", subnet_14 = "db-subnet-3", subnet_15 = "db-subnet-4", subnet_16 = "db-subnet-5", subnet_17 = "db-subnet-6"
  }
}


variable "subnet_vpc_map" {
  description = "Mapping of subnets to their parent VPCs"
  type        = map(string)
  default     = { "subnet_0" = "APP", "subnet_1" = "APP", "subnet_2" = "APP", "subnet_3" = "APP", "subnet_4" = "APP", "subnet_5" = "APP",
                  "subnet_6" = "WEB", "subnet_7" = "WEB", "subnet_8" = "WEB", "subnet_9" = "WEB", "subnet_10" = "WEB", "subnet_11" = "WEB",
                  "subnet_12" = "DB",  "subnet_13" = "DB",  "subnet_14" = "DB",  "subnet_15" = "DB",  "subnet_16" = "DB",  "subnet_17" = "DB" }
}

variable "az_map" {
  description = "Mapping of subnets to their availability zones"
  type        = map(string)
  default     = { "subnet_0" = 0, "subnet_1" = 0, "subnet_2" = 0, "subnet_3" = 1, "subnet_4" = 1, "subnet_5" = 1,
                  "subnet_6" = 0, "subnet_7" = 0, "subnet_8" = 0, "subnet_9" = 1, "subnet_10" = 1, "subnet_11" = 1,
                  "subnet_12" = 0, "subnet_13" = 0, "subnet_14" = 0, "subnet_15" = 1, "subnet_16" = 1, "subnet_17" = 1 }
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "environment" {
  description = "Environment name"
  type        = string
  default = "Dev"
}

variable "route_tables" {
  description = "Map of route table definitions"
  default = {
    app_route_table = {
      name     = "app-route-table"
      vpc_name = "APP"
    }
    web_route_table = {
      name     = "WEB-routesap-table"
      vpc_name = "WEB"
    }
    web_route_table1 = {
      name     = "WEB-routesap1-table"
      vpc_name = "WEB"
    }
  }
  type = map(object({
    name     = string
    vpc_name = string
  }))
}

variable "route_table_associations" {
  description = "Map of route table associations"
  default = {
    assoc_1 = {
      route_table_name = "app_route_table"
      subnet_name      = "app-subnet-1"
    },
    assoc_2 = {
      route_table_name = "app_route_table"
      subnet_name      = "app-subnet-2"
    }
    assoc_4 = {
      route_table_name = "web_route_table1"
      subnet_name      = "web-subnet-1"
    }
  }
  type = map(object({
    route_table_name = string
    subnet_name      = string
  }))
}