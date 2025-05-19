# RDS Module

This module creates an RDS instance with proper security configurations, backup settings, and monitoring.

## Usage

```hcl
module "rds" {
  source = "../../modules/rds"

  allocated_storage     = 20
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  db_name               = "mydb"
  username              = "admin"
  password              = "MySecurePassword123"
  db_subnet_group_name  = "my-db-subnet-group"
  security_group_id     = module.sg.security_group_id
  monitoring_role_arn   = "arn:aws:iam::123456789012:role/rds-monitoring-role"
  environment           = "dev"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| allocated_storage | The allocated storage in gigabytes | number | 20 | no |
| engine | The database engine to use | string | mysql | no |
| engine_version | The engine version to use | string | 8.0 | no |
| instance_class | The instance type of the RDS instance | string | db.t3.micro | no |
| db_name | The name of the database to create | string | mydb | no |
| username | Username for the master DB user | string | admin | no |
| password | Password for the master DB user | string | - | yes |
| db_subnet_group_name | Name of DB subnet group | string | - | yes |
| security_group_id | The security group ID to associate with | string | - | yes |
| monitoring_role_arn | The ARN for the IAM role for monitoring | string | - | yes |
| environment | Environment tag for the RDS instance | string | dev | no |

## Outputs

| Name | Description |
|------|-------------|
| db_instance_id | The RDS instance ID |
| db_instance_endpoint | The connection endpoint for the RDS instance |
| db_instance_arn | The ARN of the RDS instance |
| db_instance_status | The RDS instance status |
| db_instance_port | The database port |

## Features

- Creates an RDS instance with MySQL or PostgreSQL
- Configures automatic backups with 7-day retention
- Enables performance insights
- Configures enhanced monitoring
- Enables storage encryption
- Sets up proper maintenance windows
- Adds deletion protection
- Configures final snapshot
- Validates password complexity
- Adds proper tags for resource management 