# Corrected boolean variables
variable "alb_internal" {
  description = "Application Load Balancer Network Type"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Database across multiple Availability Zones"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Database publicly accessible"
  type        = bool
  default     = false
}

variable "database_snapshot" {
  description = "Snapshot of the Database"
  type        = bool
  default     = true
}

# Removed resource references from defaults
variable "vpc_id" {
  description = "The VPC to be deployed"
  type        = string
  default     = ""
}

variable "gateway_id" {
  description = "Identifier of the VPC Internet Gateway"
  type        = string
  default     = ""
}

# Corrected numeric variables
variable "desired_capacity" {
  description = "The number of EC2 instances that should be running in the group"
  type        = number
  default     = 3
}

variable "max_size" {
  description = "The maximum size of the autoscale group"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "The minimum size of the autoscale group"
  type        = number
  default     = 3
}