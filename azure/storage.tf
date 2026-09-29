resource "azurerm_storage_account" "app" {
  name                       = var.storage_account_name
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true

  blob_properties {
    versioning_enabled = true
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "app" {
  name                  = "app"
  storage_account_id    = azurerm_storage_account.app.id
  container_access_type = "private"
}