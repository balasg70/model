
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "bucket_name" {
  description = "S3 bucket name"
}

variable "allocated_storage" {
  default = 20
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "8.0"
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "db_name" {
  default = "mydb"
}

variable "username" {
  default = "admin"
}

variable "password" {
  type        = string
  sensitive   = true
  description = "RDS master password"
  validation {
    condition     = length(var.password) >= 8 && 
                    can(regex("[A-Z]", var.password)) && 
                    can(regex("[a-z]", var.password)) && 
                    can(regex("[0-9]", var.password)) && 
                    can(regex("[!@#$%^&*()_+]", var.password))
    error_message = "Password must be at least 8 characters and contain uppercase, lowercase, numbers, and special characters"
  }
}

variable "db_subnet_group_name" {
  default = "default"
}

variable "create_vpc" {
  default = true
}

variable "create_ec2" {
  default = true
}

variable "create_s3" {
  default = true
}

variable "create_rds" {
  default = true
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "monitoring_role_arn" {
   type = string
}