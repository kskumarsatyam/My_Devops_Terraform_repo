resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "stage"
    managed_by  = "terraform"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname131214"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}

 