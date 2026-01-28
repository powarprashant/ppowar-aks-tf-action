resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}-aks"

  kubernetes_version = null
  node_resource_group = "${var.prefix}-aks-nodes"

  default_node_pool {
    name       = "system"
    vm_size    = var.vm_size
    node_count = var.node_count
    type       = "VirtualMachineScaleSets"
    os_disk_size_gb = 60
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"
    outbound_type  = "loadBalancer"
  }

  role_based_access_control_enabled = true
}
