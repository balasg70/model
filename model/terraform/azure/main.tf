
provider "azurerm" {
  features {}
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_cidr           = var.vnet_cidr
  subnet_cidr         = var.subnet_cidr
}

module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
}

module "sql" {
  source              = "./modules/sql"
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_server_name     = var.sql_server_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  database_name       = var.database_name
}

module "keyvault" {
  source            = "./modules/keyvault"
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_name      = var.key_vault_name
  tenant_id           = var.tenant_id
  secret_value        = var.admin_password
}
