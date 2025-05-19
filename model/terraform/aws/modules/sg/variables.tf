variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "ssh_cidr_blocks" {
  description = "List of CIDR blocks to allow SSH access from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks to allow HTTP/HTTPS access from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vpc_cidr_blocks" {
  description = "List of CIDR blocks for the VPC"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "environment" {
  description = "Environment tag for the security group"
  type        = string
  default     = "dev"
}

variable "name_prefix" {
  description = "Prefix for the security group name"
  type        = string
  default     = "allow"
}

variable "create" {
  type    = bool
  default = true
}