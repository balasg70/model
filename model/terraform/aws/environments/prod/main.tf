module "vpc" {
  source = "../../modules/vpc"
  count  = var.create_vpc

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "sg" {
  source = "../../modules/sg"
  count  = var.create_sg
  vpc_id = var.create_vpc ? module.vpc[0].vpc_id : null
}

module "ec2" {
  source        = "../../modules/ec2"
  count         = var.create_ec2
  instance_type = var.instance_type
  subnet_id     = var.create_vpc ? module.vpc[0].public_subnet_id : null
  security_group_id = var.create_sg ? module.sg[0].security_group_id : null
}

module "s3" {
  source      = "../../modules/s3"
  count       = var.create_s3
  bucket_name = var.bucket_name
}

module "rds" {
  source                = "../../modules/rds"
  count                 = var.create_rds
  allocated_storage     = var.allocated_storage
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  username              = var.username
  password              = var.password
  db_subnet_group_name  = var.db_subnet_group_name
  security_group_id     = var.create_sg ? module.sg[0].security_group_id : null
  subnet_ids            = var.create_vpc ? [module.vpc[0].private_subnet_id] : []
}
