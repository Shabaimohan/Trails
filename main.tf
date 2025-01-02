module "vpc" {
  source           = "./modules/VPC"
  vpc_cidrs = var.vpc_cidrs
  vpc_names        = var.vpc_names
  vpc_environments = var.vpc_environments
  vpc_region       = var.vpc_region
  vpc_dns          = var.vpc_dns
  aws_region = var.vpc_region
  
}

module "subnet" {
  source = "./modules/subnet"

  vpc_ids = { APP = module.vpc.vpc_ids[0], WEB = module.vpc.vpc_ids[1], DB = module.vpc.vpc_ids[2] }
  subnet_cidrs        = var.subnet_cidrs
  subnet_names        = var.subnet_names
  subnet_vpc_map      = var.subnet_vpc_map
  az_map              = var.az_map
  availability_zones  = var.availability_zones
  environment         = var.environment
  
}

module "route_table" {
  source = "./modules/route_table"

  vpc_ids                = { APP = module.vpc.vpc_ids[0], WEB = module.vpc.vpc_ids[1] }
  subnet_ids             = { for key, id in module.subnet.subnet_ids : key => id }
  route_tables           = var.route_tables
  route_table_associations = var.route_table_associations
  environment            = var.environment
}

module "vpg" {
  source       = "./modules/virtualprivategateway"
  vpc_ids      = { APP = module.vpc.vpc_ids[0], DB = module.vpc.vpc_ids[2] }
  vpgs         = var.vpgs
  environment  = var.environment
}

module "tgw" {
  source                       = "./modules/transistgateway"
  name                         = var.transit_gateway.name
  description                  = var.transit_gateway.description
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  vpc_attachments              = var.vpc_attachments
  vpc_ids                      = { APP = module.vpc.vpc_ids[0], WEB = module.vpc.vpc_ids[1] }
  subnet_ids                   = module.subnet.subnet_ids
  environment                  = var.environment
}





