
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "security_group_id" {
  value = module.sg.security_group_id
}
