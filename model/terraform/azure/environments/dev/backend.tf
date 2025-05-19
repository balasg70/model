  backend "azurerm" {
    resource_group_name  = "tfstate-rg"       # Resource group for storage account
    storage_account_name = "tfstatestorage"   # Storage account name
    container_name       = "tfstatedev"          # Storage container name
    key                  = "dev.terraform.tfstate"  # State file name
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}