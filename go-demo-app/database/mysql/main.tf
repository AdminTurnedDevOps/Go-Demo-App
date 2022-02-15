terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-storage-rg"
    storage_account_name = "benchmarktfstatesg"
    container_name       = "tfstate-files"
    key                  = "azure-mysql-demoapps.tfstate"
 }

  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_mysql_server" "demoapp" {
  name                = var.mysql_server_name
  location            = var.location
  resource_group_name = var.resource_group

  administrator_login          = "mysqladmin"
  administrator_login_password = var.administrator_password

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "example" {
  name                = var.db_name
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_server.demoapp.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}