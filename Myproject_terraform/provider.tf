terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "infra_group"       
    storage_account_name = "testaccount051088" 
    container_name       = "backend-data"     
    key                  = "terraform.tfstate" 
    
    # CORRECT SYNTAX: Forces backend initialization to use environment variable, not CLI
    use_msi = false
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  
  # Forces the subsequent plan/apply runner jobs to use environment variables
  use_cli = false
}

