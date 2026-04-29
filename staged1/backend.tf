terraform {
  backend "azurerm" {
    resource_group_name  = "myResourceGroup"
    storage_account_name = "mystorageacct15665542178"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}