provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "example" {
  name                     = var.azure_storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  identity {
    type = "SystemAssigned"
  }

  network_rules {
    default_action = "Deny"
    ip_rules = []
    virtual_network_subnet_ids = []
    bypass = ["AzureServices"]
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "examplecontainer"
  storage_account_name  = var.azure_storage_name
  container_access_type = "private"

  depends_on = [azurerm_storage_account.example]

  lifecycle {
    ignore_changes = [
      container_access_type,
    ]
  }
}

resource "azurerm_role_assignment" "example" {
  scope              = azurerm_storage_account.example.id
  role_definition_id = data.azurerm_role_definition.storage_blob_data_contributor.id
  principal_id       = var.principal_id
}

data "azurerm_role_definition" "storage_blob_data_contributor" {
  name = "Storage Blob Data Contributor"
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}
