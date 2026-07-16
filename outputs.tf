output "datadog_monitors_id" {
  description = "Map of id values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.id if v.id != null && length(v.id) > 0 }
}
output "datadog_monitors_datadog_organization" {
  description = "Map of datadog_organization values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.datadog_organization if v.datadog_organization != null && length(v.datadog_organization) > 0 }
  sensitive   = true
}
output "datadog_monitors_identity" {
  description = "Map of identity values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "datadog_monitors_location" {
  description = "Map of location values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.location if v.location != null && length(v.location) > 0 }
}
output "datadog_monitors_marketplace_subscription_status" {
  description = "Map of marketplace_subscription_status values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.marketplace_subscription_status if v.marketplace_subscription_status != null && length(v.marketplace_subscription_status) > 0 }
}
output "datadog_monitors_monitoring_enabled" {
  description = "Map of monitoring_enabled values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.monitoring_enabled if v.monitoring_enabled != null }
}
output "datadog_monitors_name" {
  description = "Map of name values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.name if v.name != null && length(v.name) > 0 }
}
output "datadog_monitors_resource_group_name" {
  description = "Map of resource_group_name values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "datadog_monitors_sku_name" {
  description = "Map of sku_name values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.sku_name if v.sku_name != null && length(v.sku_name) > 0 }
}
output "datadog_monitors_tags" {
  description = "Map of tags values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "datadog_monitors_user" {
  description = "Map of user values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.user if v.user != null && length(v.user) > 0 }
}

