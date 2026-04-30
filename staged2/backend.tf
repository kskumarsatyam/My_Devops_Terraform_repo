terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "your-state-rg-name"
    storage_account_name = "yourstatestorageaccount"
    container_name       = "tfstate"
    key                  = "storage.terraform.tfstate"
  }
}
