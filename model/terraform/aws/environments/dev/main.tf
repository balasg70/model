# Move data source before the provider block
data "external" "aws_creds" {
  program = ["powershell.exe", "-File", "${path.module}/external_data.ps1"]
}

module "vpc" {
  source = "../../modules/vpc"
  count  = var.create_vpc ? 1 : 0

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "sg" {
  source = "../../modules/sg"
  count  = var.create_sg ? 1 : 0
  vpc_id = var.create_vpc ? module.vpc[0].vpc_id : null
}

module "ec2" {
  source           = "../../modules/ec2"
  count           = var.create_ec2 ? 1 : 0
  instance_type    = var.instance_type
  subnet_id        = var.create_vpc ? module.vpc[0].public_subnet_id : null
  security_group_id = var.create_sg ? module.sg[0].security_group_id : null
}

# Combine the two s3 module declarations into one
module "s3" {
  source        = "../../modules/s3"
  count         = var.create_s3 ? 1 : 0
  bucket_name   = var.bucket_name
}

module "rds" {
  source               = "../../modules/rds"
  count                = var.create_rds ? 1 : 0
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.db_subnet_group_name
  security_group_id    = var.create_sg ? module.sg[0].security_group_id : null
  subnet_ids           = var.create_vpc ? [module.vpc[0].private_subnet_id] : []
  monitoring_role_arn  = var.monitoring_role_arn
}

module "iam" {
  source    = "../../modules/iam"
  role_name = "terraform-secret-reader-dev"
}

module "secrets" {
  source          = "../../modules/secrets"
  secret_name     = "terraform/aws/dev/credentials"
  aws_access_key  = var.aws_access_key
  aws_secret_key  = var.aws_secret_key
}

data "external" "aws_creds" {
  program = ["bash", "${path.module}/external_data.sh"]
}

