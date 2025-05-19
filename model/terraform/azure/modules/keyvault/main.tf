resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"

  soft_delete_enabled         = true
  deletion_protection_enabled = false
}

resource "azurerm_key_vault_secret" "example" {
  name         = "admin-password"
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.kv.id
}
