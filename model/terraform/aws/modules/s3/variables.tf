variable "bucket_name" {
  description = "The name of the bucket. Must be globally unique"
  type        = string
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be between 3 and 63 characters, contain only lowercase letters, numbers, hyphens, and periods, and start and end with a letter or number"
  }
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "lifecycle_rule_days" {
  description = "Number of days after which objects will be expired"
  type        = number
  default     = 90
  validation {
    condition     = var.lifecycle_rule_days >= 1
    error_message = "Lifecycle rule days must be at least 1"
  }
}

variable "environment" {
  description = "Environment tag for the bucket"
  type        = string
  default     = "dev"
}

variable "create" {
  type    = bool
  default = true
}
