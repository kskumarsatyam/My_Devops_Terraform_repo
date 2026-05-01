provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "storage_account" {
  # This path stays the same because both folders are siblings
  source              = "../modules/storage" 
  name                = lower(replace(var.st_name, "/[^a-zA-Z0-9]/", ""))
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}
