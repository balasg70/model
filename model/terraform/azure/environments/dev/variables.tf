variable "storage_account_name" {
  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account name must be 3-24 characters, lowercase letters and numbers only."
  }
}
variable "resource_group_name" {
  default = "rg-iac-demo"
}

variable "location" {
  default = "East US"
}

variable "vnet_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  default = "AzurePa$$w0rd123!"
}

variable "sql_server_name" {
  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.sql_server_name))
    error_message = "SQL Server name must be 3-24 characters, lowercase letters and numbers only."
  }
    default = "iacsqlserver123"
}

variable "database_name" {
  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.database_name))
    error_message = "Database name must be 3-24 characters, lowercase letters and numbers only."
  }
  default = "iacdatabase"
}

variable "key_vault_name" {
  default = "iackeyvault123"
}

variable "tenant_id" {
  description = "Azure tenant ID"
}
