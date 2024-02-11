resource "aws_network_acl" "MGMT_ACL" {
vpc_id = module.vpc.vpc_id
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  subnet_ids=  [module.vpc.public_subnets[0],
  module.vpc.public_subnets[1]]

  tags = {
    Name = "MGMT-ACL"
  }
    depends_on = [module.vpc]

}
resource "aws_network_acl" "WEB_ACL" {
vpc_id = module.vpc.vpc_id
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  subnet_ids=  [module.vpc.public_subnets[2],
  module.vpc.public_subnets[3]] 
   tags = {
    Name = "WEB-ACL"
  }
    depends_on = [module.vpc]

}
resource "aws_network_acl" "APP_ACL" {
vpc_id = module.vpc.vpc_id
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  subnet_ids=  [module.vpc.private_subnets[0],
  module.vpc.private_subnets[1]] 
   tags = {
    Name = "APP-ACL"
  }
    depends_on = [module.vpc]

}
resource "aws_network_acl" "DB_ACL" {
vpc_id = module.vpc.vpc_id
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
   subnet_ids=  [module.vpc.private_subnets[2],
  module.vpc.private_subnets[3]] 
  tags = {
    Name = "DB-ACL"
  }
    depends_on = [module.vpc]
}

#Route_table-MGMT-public
resource "aws_route_table" "VF-MGMT-RT" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.igw_id
  }


  tags = {
    Name = "VF-MGMT-RT"
  }
      depends_on = [module.vpc]

}
#Route table association
resource "aws_route_table_association" "VF-MGMT-RT-ASSOCIATION1" {
subnet_id = element(module.vpc.public_subnets, 0)
  route_table_id = aws_route_table.VF-MGMT-RT.id
}
resource "aws_route_table_association" "VF-MGMT-RT-ASSOCIATION2" {
subnet_id = element(module.vpc.public_subnets, 1)
  route_table_id = aws_route_table.VF-MGMT-RT.id
}


#Route_table-WEB
resource "aws_route_table" "VF-WEB-RT" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.igw_id
  }


  tags = {
    Name = "VF-WEB-RT"
  }
      depends_on = [module.vpc]

}
#Route table association
resource "aws_route_table_association" "VF-WEB-RT-ASSOCIATION1" {
subnet_id = element(module.vpc.public_subnets, 2)
  route_table_id = aws_route_table.VF-WEB-RT.id
}
resource "aws_route_table_association" "VF-WEB-RT-ASSOCIATION2" {
subnet_id = element(module.vpc.public_subnets, 3)
  route_table_id = aws_route_table.VF-WEB-RT.id
}
#Route_table-db-PRIVATE 
resource "aws_route_table" "VF-DB-RT" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(module.vpc.natgw_ids,0)
  }


  tags = {
    Name = "VF-DB-RT"
  }
      depends_on = [module.vpc]

}
#Route table association
resource "aws_route_table_association" "VF-DB-RT-ASSOCIATION1" {
subnet_id = element(module.vpc.private_subnets, 0)
  route_table_id = aws_route_table.VF-DB-RT.id
}
resource "aws_route_table_association" "VF-DB-RT-ASSOCIATION2" {
subnet_id = element(module.vpc.private_subnets, 1)
  route_table_id = aws_route_table.VF-DB-RT.id
}

#Route_table-APP-PRIVATE 
resource "aws_route_table" "VF-APP-RT" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(module.vpc.natgw_ids,0)
  }


  tags = {
    Name = "VF-APP-RT"
  }
      depends_on = [module.vpc]

}
#Route table association
resource "aws_route_table_association" "VF-APP-RT-ASSOCIATION1" {
subnet_id = element(module.vpc.private_subnets, 2)
  route_table_id = aws_route_table.VF-APP-RT.id
}
resource "aws_route_table_association" "VF-APP-RT-ASSOCIATION2" {
subnet_id = element(module.vpc.private_subnets, 3)
  route_table_id = aws_route_table.VF-APP-RT.id
}