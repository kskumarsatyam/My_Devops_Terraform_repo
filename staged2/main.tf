
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "st" {
  # Sanitizes the name to be lowercase and alphanumeric only
  name                     = lower(replace(var.st_name, "/[^a-zA-Z0-9]/", ""))
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
