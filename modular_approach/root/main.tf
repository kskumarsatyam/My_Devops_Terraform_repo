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

module "azurerm_resource_group" "rg" {
  source = ""../modules/storage""
  name     = var.rg_name
  location = var.location
}

module "storage_account" {
  source   = "../modules/storage"
  st_name  = lower(replace(var.st_name, "/[^a-zA-Z0-9]/", ""))
  rg_name  = var.rg_name
  location = var.location
}


