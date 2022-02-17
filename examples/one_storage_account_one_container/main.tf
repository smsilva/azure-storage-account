locals {
  storage_account_name = "silviostest${random_string.storage_account_id.result}"
  resource_group_name  = local.storage_account_name
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = "eastus2"
}

module "storage_account" {
  source = "../../src"

  name           = local.storage_account_name
  resource_group = azurerm_resource_group.default
}

module "storage_account_container" {
  source = "../../src/container"

  storage_account = module.storage_account.instance
  name            = "terraform"
  access_type     = "private"
}

output "storage_account_container_instance" {
  value     = module.storage_account_container.instance
  sensitive = true
}
