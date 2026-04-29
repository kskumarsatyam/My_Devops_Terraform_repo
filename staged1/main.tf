resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = each.key
  location = each.value
}

resource "azurerm_storage_account" "example" {
  for_each = azurerm_resource_group.rg

  name                = name = "st${replace(each.key, "-", "")}131214"
  resource_group_name = each.value.name
  location            = each.value.location

  account_tier             = "Standard"
  account_replication_type = "LRS"


  depends_on = [
    azurerm_resource_group.rg
  ]
}


 