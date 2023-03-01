provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.azure_rg
  location = var.azure_location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_clustername
  location            = azurerm_resource_group.rg.location
  resource_group_name = var.azure_rg
  dns_prefix          = var.aks_clustername_dnsprefix

  default_node_pool {
    name       = "default"
    node_count = var.worker_node_count
    vm_size    = var.worker_node_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Demo"
  }
}
