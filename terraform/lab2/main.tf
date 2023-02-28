provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.azure_rg
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_clustername
  location            = azurerm_resource_group.rg.location
  resource_group_name = var.azure_rg
  dns_prefix          = var.aks_clustername_dnsprefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Demo"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}
