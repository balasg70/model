variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
  validation {
    condition     = can(regex("^t[23]\\.(micro|small|medium)$", var.instance_type))
    error_message = "Must be a valid t2 or t3 instance type"
  }
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to associate with"
  type        = string
}

variable "key_name" {
  description = "The key name of the Key Pair to use for the instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the root volume in gigabytes"
  type        = number
  default     = 20
  validation {
    condition     = var.volume_size >= 8 && var.volume_size <= 16384
    error_message = "Volume size must be between 8 and 16384 GB"
  }
}

variable "volume_type" {
  description = "Type of root volume. Can be standard, gp2, gp3, io1, io2, sc1, or st1"
  type        = string
  default     = "gp3"
  validation {
    condition     = contains(["standard", "gp2", "gp3", "io1", "io2", "sc1", "st1"], var.volume_type)
    error_message = "Must be a valid EBS volume type"
  }
}

variable "create" {
  type    = bool
  default = true
}
