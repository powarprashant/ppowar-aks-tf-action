terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "~> 3.100"
      version = "~> 3.117.1"
    }
  }
}
                                                                                                                         
provider "azurerm" {                                                                                                     
  features {}                                                                                                            
}   
# Create a Azure resource group
resource "azurerm_resource_group" "aks-rg2" {                                                                          
  name     = "aks-rg2-tf"                                                                                         
  location = "Central US"                                                                                               
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-demo"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "demo-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "demoaks"

  default_node_pool {
    name       = "system"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}