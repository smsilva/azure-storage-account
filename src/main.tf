locals {
  storage_account_name = var.name
}

resource "azurerm_storage_account" "default" {
  name                      = local.storage_account_name
  resource_group_name       = var.resource_group.name
  location                  = var.resource_group.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true
  tags                      = var.tags
}

resource "azurerm_storage_container" "terraform" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.default.name
  container_access_type = var.container_access_type
}

output "instance" {
  value = azurerm_storage_account.default
}

output "container" {
  value = azurerm_storage_container.terraform
}
