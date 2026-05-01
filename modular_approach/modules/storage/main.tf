

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "st" {
  name                     = var.st_name
  resource_group_name      = resource_group_name = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location 
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

