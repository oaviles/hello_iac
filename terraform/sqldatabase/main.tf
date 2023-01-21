provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "OA_Terraform_Zone"
  location = "East US"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "oa-sqlserver01"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = random_password.password.result
}

resource "azurerm_mssql_database" "sqldatabase" {
  name           = "oa-sqldb01"
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false

  tags = {
    environment = "poc"
  }
}
