
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

variable "storage_account_name" {
  default = "iacstorageacctdemo"
}

variable "sql_server_name" {
  default = "iacsqlserver123"
}

variable "database_name" {
  default = "iacdatabase"
}

variable "key_vault_name" {
  default = "iackeyvault123"
}

variable "tenant_id" {
  description = "Azure tenant ID"
}
