variable "resource_groups" {
  type = map(string)

  default = {
    rg-dev  = "eastus"
    rg-prod = "centralindia"
  }
}