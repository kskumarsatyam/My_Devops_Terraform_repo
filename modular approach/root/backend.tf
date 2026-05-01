terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstateaccount"
    container_name       = "tfstate"
    key                  = "staged2.terraform.tfstate"
  }
}
