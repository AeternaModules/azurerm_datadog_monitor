output "datadog_monitors" {
  description = "All datadog_monitor resources"
  value       = azurerm_datadog_monitor.datadog_monitors
  sensitive   = true
}
output "datadog_monitors_datadog_organization" {
  description = "List of datadog_organization values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.datadog_organization]
  sensitive   = true
}
output "datadog_monitors_identity" {
  description = "List of identity values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.identity]
}
output "datadog_monitors_location" {
  description = "List of location values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.location]
}
output "datadog_monitors_marketplace_subscription_status" {
  description = "List of marketplace_subscription_status values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.marketplace_subscription_status]
}
output "datadog_monitors_monitoring_enabled" {
  description = "List of monitoring_enabled values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.monitoring_enabled]
}
output "datadog_monitors_name" {
  description = "List of name values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.name]
}
output "datadog_monitors_resource_group_name" {
  description = "List of resource_group_name values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.resource_group_name]
}
output "datadog_monitors_sku_name" {
  description = "List of sku_name values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.sku_name]
}
output "datadog_monitors_tags" {
  description = "List of tags values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.tags]
}
output "datadog_monitors_user" {
  description = "List of user values across all datadog_monitors"
  value       = [for k, v in azurerm_datadog_monitor.datadog_monitors : v.user]
}

