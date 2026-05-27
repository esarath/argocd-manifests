terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "poc-rg"
    storage_account_name = "pocstatestorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
