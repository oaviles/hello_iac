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
