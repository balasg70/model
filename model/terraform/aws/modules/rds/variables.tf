variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
  validation {
    condition     = var.allocated_storage >= 20 && var.allocated_storage <= 65536
    error_message = "Storage must be between 20 and 65536 GB"
  }
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
  validation {
    condition     = contains(["mysql", "postgres"], var.engine)
    error_message = "Engine must be either mysql or postgres"
  }
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
  validation {
    condition     = can(regex("^db\\.t[23]\\.(micro|small|medium)$", var.instance_class))
    error_message = "Must be a valid RDS instance class"
  }
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
  default     = "mydb"
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.password) >= 8 && can(regex(".*[A-Z].*", var.password)) && can(regex(".*[a-z].*", var.password)) && can(regex(".*[0-9].*", var.password))
    error_message = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number"
  }
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to associate with"
  type        = string
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
}

variable "environment" {
  description = "Environment tag for the RDS instance"
  type        = string
  default     = "dev"
}

variable "create" {
  type    = bool
  default = true
}

