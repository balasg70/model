output "vpc_id" {
  description = "The VPC to be deployed"
  value = module.vpc.vpc_id
}

output "gateway_id" {
  description = "Identifier of the VPC Internet Gateway" 
  value = modules.vpc.gateway_id
}

output "db_subnet_group_id" {
  description = "Database Subnet Group"
  value = module.vpc.db_subnet_group_id
}

output "app_security_group_id" {
  description = "App Instance Security Group"
  value = module.vpc.app_security_group.id
}

output "alb_security_group_id" {
  description = "Application Load Balancer Security Group"
  value = module.vpc.alb_security_group.id
}

output "db_security_group_id" {
  description = "Database Security Group"
  value = module.vpc.db_security_group.id
}

output "launch_template_id" {
  description = "Launch Template ID"
  value = module.ec2.launch_template_id
}