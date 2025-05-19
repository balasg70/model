variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "iac-resources"
}

variable "subnet_id" {
  description = "ID of the subnet where the VM will be attached"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  sensitive   = true
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "linux-vm-iac"
}

variable "nic_name" {
  description = "Name of the network interface"
  type        = string
  default     = "nic-iac"
}

variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
  default     = "publicip-iac"
}

variable "os_disk_caching" {
  description = "Caching type for OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_type" {
  description = "Storage account type for OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "Version of the VM image"
  type        = string
  default     = "latest"
}