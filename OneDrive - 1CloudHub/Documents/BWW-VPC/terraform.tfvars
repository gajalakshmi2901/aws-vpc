name="test-vpc"
cidr="10.0.0.0/16"
create_vpc=true
azs=["ap-south-1a","ap-south-1b"]
private_subnets=["10.1.5.0/24","10.1.6.0/24","10.1.7.0/24","10.1.8.0/24"]
public_subnets=["10.1.1.0/24","10.1.2.0/24","10.1.3.0/24","10.1.4.0/24",]
enable_nat_gateway=true
enable_vpn_gateway=false
enable_flow_log=false
tags = {
    Terraform = "true"
    Environment = "dev"
  }
public_subnet_names= ["Mgmt-Subnet-1A","Mgmt-Subnet-1B","Web-Subnet-1A","Web-Subnet-1B"]
private_subnet_names=["APP-Subnet-1A","APP-Subnet-1B","DB-Subnet-1A","DB-Subnet-1B"]
single_nat_gateway=true
nat_name="VF-NAT"
