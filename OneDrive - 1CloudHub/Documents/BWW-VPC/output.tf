output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(module.vpc[0].id, null)
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
