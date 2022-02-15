locals {
  storage_account_name = "silviostest${random_string.storage_account_id.result}"
  resource_group_name  = local.storage_account_name
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = "eastus2"
}

module "terraform_state" {
  source = "../../src"

  name           = local.storage_account_name
  resource_group = azurerm_resource_group.default
}

output "storage_account_instance" {
  value     = module.terraform_state.instance
  sensitive = true
}
