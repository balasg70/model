resource "aws_db_instance" "default" {
  count             = var.create ? 1 : 0
  allocated_storage      = var.allocated_storage
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.security_group_id]
  
  # Backup configuration
  backup_retention_period = 7
  backup_window          = "03:00-04:00"
  
  # Maintenance configuration
  maintenance_window = "Mon:04:00-Mon:05:00"
  
  # Performance configuration
  storage_type          = "gp3"
  iops                  = 3000
  storage_encrypted     = true
  performance_insights_enabled = true
  performance_insights_retention_period = 7
  
  # Monitoring
  monitoring_interval = 60
  monitoring_role_arn = var.monitoring_role_arn
  
  # Security
  deletion_protection = true
  skip_final_snapshot = false
  final_snapshot_identifier = "${var.db_name}-final-snapshot"
  
  tags = {
    Name        = var.db_name
    Environment = "dev"
  }
}
