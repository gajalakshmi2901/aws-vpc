module "vpc" {
  source = "./vpc"
  name =var.name
  cidr = var.cidr
  create_vpc = var.create_vpc
  azs             = var.azs
  private_subnets =var.private_subnets
  public_subnets  =var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  enable_flow_log=var.enable_flow_log
  tags = var.tags
  public_subnet_names = var.public_subnet_names
  private_subnet_names = var.private_subnet_names
  single_nat_gateway=var.single_nat_gateway
  nat_name = var.nat_name
  igw_name = var.igw_name
}