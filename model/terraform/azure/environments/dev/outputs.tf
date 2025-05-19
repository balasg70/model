
output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "vm_public_ip" {
  value = module.vm.public_ip
}

output "storage_account_name" {
  value = module.storage.name
}

output "sql_server_name" {
  value = module.sql.sql_server_name
}

output "sql_database_name" {
  value = module.sql.sql_database_name
}

output "key_vault_uri" {
  value = module.keyvault.key_vault_uri
}
