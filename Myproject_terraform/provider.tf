terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.62.1"
    }
  }
}

provider "azurerm" {
  features {}

  # Service Principal authentication
  client_id       = "fa7361ba-a92e-42b3-9893-5a97e3cb80f0"
  client_secret   = "fW18Q~HvxRNSKUpe9hIsoOhRPRxxNq97Em-W~bTB"
  tenant_id       = "4b160a7b-32ac-4e50-b069-a6304394236f"
  subscription_id = "9ff9c4f2-eb4e-4430-b232-ac9011fe99bc"
}
