output "vm_id" {
  description = "ID of the created virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_public_ip" {
  description = "Public IP address of the virtual machine"
  value       = azurerm_public_ip.vm_public_ip.ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the virtual machine"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "vm_admin_username" {
  description = "Admin username for the virtual machine"
  value       = var.admin_username
  sensitive   = true
}

output "nic_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.nic.id
}

output "public_ip_id" {
  description = "ID of the public IP address"
  value       = azurerm_public_ip.vm_public_ip.id
}

output "vm_connection_string" {
  description = "SSH connection string for the virtual machine"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.vm_public_ip.ip_address}"
  sensitive   = true
}