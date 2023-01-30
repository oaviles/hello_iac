terraform {
   required_providers {
    azurerm = "~> 2.11.0"
  }
  backend "remote" {
    organization = "personal-mobile"
    workspaces {
      name = "IaC_Workshop"
    }
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  # skip_provider_registration = "true"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.azure-rg
  location = "East US"
}

resource "azurerm_storage_account" "storage1" {
  name                     = var.azure-storage-name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "demo"
  }
}
