variable "storage_account" {}

variable "name" {}

variable "access_type" {
  type        = string
  description = "Container Access Type"
  default     = "private"
}

resource "azurerm_storage_container" "default" {
  name                  = var.name
  storage_account_name  = var.storage_account.name
  container_access_type = var.access_type
}

output "instance" {
  value = azurerm_storage_container.default
}
