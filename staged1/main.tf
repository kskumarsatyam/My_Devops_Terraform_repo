resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = each.key
  location = each.value
}
resource "random_string" "suffix" {
  for_each = azurerm_resource_group.rg

  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}
resource "azurerm_storage_account" "example" {
  for_each = azurerm_resource_group.rg

  name = "st${random_string.suffix[each.key].result}${substr(each.key, 0, 3)}"
  resource_group_name = each.value.name
  location            = each.value.location

  account_tier             = "Standard"
  account_replication_type = "LRS"


  depends_on = [
    azurerm_resource_group.rg
  ]
}


 