locals {
  storage_account_name = var.name
}

resource "azurerm_storage_account" "default" {
  name                      = local.storage_account_name
  resource_group_name       = var.resource_group.name
  location                  = var.resource_group.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  allow_blob_public_access  = var.allow_blob_public_access
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true
  tags                      = var.tags
}
