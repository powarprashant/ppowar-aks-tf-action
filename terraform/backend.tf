terraform {
  backend "azurerm" {
    resource_group_name   = "ppowar-poc-rg"
    storage_account_name  = "ppowarstg"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
