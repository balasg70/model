variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = contains(["us-east-1", "us-west-2", "eu-west-1"], var.aws_region)
    error_message = "Invalid AWS region. Must be one of: us-east-1, us-west-2, eu-west-1"
  }
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.vpc_cidr))
    error_message = "Must be a valid CIDR block"
  }
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
  default     = "10.0.1.0/24"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.public_subnet_cidr))
    error_message = "Must be a valid CIDR block"
  }
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for private subnet"
  default     = "10.0.2.0/24"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.private_subnet_cidr))
    error_message = "Must be a valid CIDR block"
  }
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
  validation {
    condition     = can(regex("^t[23]\\.(micro|small|medium)$", var.instance_type))
    error_message = "Must be a valid t2 or t3 instance type"
  }
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
  default     = "my-terraform-bucket"
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be between 3 and 63 characters, contain only lowercase letters, numbers, hyphens, and periods, and start and end with a letter or number"
  }
}

variable "allocated_storage" {
  type        = number
  description = "RDS allocated storage in GB"
  default     = 20
  validation {
    condition     = var.allocated_storage >= 20 && var.allocated_storage <= 65536
    error_message = "Storage must be between 20 and 65536 GB"
  }
}

variable "engine" {
  type        = string
  description = "RDS engine type"
  default     = "mysql"
  validation {
    condition     = contains(["mysql", "postgres"], var.engine)
    error_message = "Engine must be either mysql or postgres"
  }
}

variable "engine_version" {
  type        = string
  description = "RDS engine version"
  default     = "8.0"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
  validation {
    condition     = can(regex("^db\\.t[23]\\.(micro|small|medium)$", var.instance_class))
    error_message = "Must be a valid RDS instance class"
  }
}

variable "db_name" {
  type        = string
  description = "RDS database name"
  default     = "mydb"
}

variable "username" {
  type        = string
  description = "RDS master username"
  default     = "admin"
}

variable "password" {
  type        = string
  description = "RDS master password (must be at least 8 characters with uppercase, lowercase, and numbers)"
  sensitive   = true
  validation {
    condition     = length(var.password) >= 8 && can(regex(".*[A-Z].*", var.password)) && can(regex(".*[a-z].*", var.password)) && can(regex(".*[0-9].*", var.password))
    error_message = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number"
  }
}

variable "db_subnet_group_name" {
  type        = string
  description = "RDS subnet group name"
  default     = "default"
}

# Module creation flags
variable "create_vpc" {
  type        = bool
  description = "Whether to create the VPC"
  default     = true
}

variable "create_ec2" {
  type        = bool
  description = "Whether to create the EC2 instance"
  default     = true
}

variable "create_s3" {
  type        = bool
  description = "Whether to create the S3 bucket"
  default     = true
}

variable "create_rds" {
  type        = bool
  description = "Whether to create the RDS instance"
  default     = true
}

variable "create_sg" {
  type        = bool
  description = "Whether to create the security group"
  default     = true
}
