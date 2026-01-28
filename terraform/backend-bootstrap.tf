resource "azurerm_resource_group" "backend" {
  name     = "ppowar-backend-rg"
  location = var.location
}

resource "azurerm_storage_account" "backend" {
  name                     = "ppowarbackendsa"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}
