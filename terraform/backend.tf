terraform {
  backend "azurerm" {
    resource_group_name  = "ppowar-backend-rg"
    storage_account_name = "ppowarbackendsa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
}
