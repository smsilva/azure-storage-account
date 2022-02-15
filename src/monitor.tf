resource "azurerm_monitor_action_group" "default" {
  name                = "CriticalAlertsAction"
  resource_group_name = var.resource_group.name
  short_name          = "p0action"

  azure_app_push_receiver {
    name          = "pushtoadmin"
    email_address = "admin@contoso.com"
  }

  tags = var.tags
}

resource "azurerm_monitor_activity_log_alert" "default" {
  name                = "${var.name}-activitylogalert"
  resource_group_name = var.resource_group.name
  scopes              = [var.resource_group.id]
  description         = "This alert will monitor a specific storage account updates."

  criteria {
    resource_id    = azurerm_storage_account.default.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }

  action {
    action_group_id = azurerm_monitor_action_group.default.id

    webhook_properties = {
      from = "terraform"
    }
  }

  tags = var.tags
}
