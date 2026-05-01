terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  }
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "storage_account" {
  # This goes UP one level from 'root' then into 'modules/storage'
  source = "../modules/storage"
  
  st_name = var.st_name
  rg_name = var.rg_name
  location = var.location
}

