output "datadog_monitors_datadog_organization" {
  description = "Map of datadog_organization values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.datadog_organization }
  sensitive   = true
}
output "datadog_monitors_identity" {
  description = "Map of identity values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.identity }
}
output "datadog_monitors_location" {
  description = "Map of location values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.location }
}
output "datadog_monitors_marketplace_subscription_status" {
  description = "Map of marketplace_subscription_status values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.marketplace_subscription_status }
}
output "datadog_monitors_monitoring_enabled" {
  description = "Map of monitoring_enabled values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.monitoring_enabled }
}
output "datadog_monitors_name" {
  description = "Map of name values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.name }
}
output "datadog_monitors_resource_group_name" {
  description = "Map of resource_group_name values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.resource_group_name }
}
output "datadog_monitors_sku_name" {
  description = "Map of sku_name values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.sku_name }
}
output "datadog_monitors_tags" {
  description = "Map of tags values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.tags }
}
output "datadog_monitors_user" {
  description = "Map of user values across all datadog_monitors, keyed the same as var.datadog_monitors"
  value       = { for k, v in azurerm_datadog_monitor.datadog_monitors : k => v.user }
}

