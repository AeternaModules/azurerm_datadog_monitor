resource "azurerm_datadog_monitor" "datadog_monitors" {
  for_each = var.datadog_monitors

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  monitoring_enabled  = each.value.monitoring_enabled
  tags                = each.value.tags

  datadog_organization {
    api_key           = each.value.datadog_organization.api_key
    application_key   = each.value.datadog_organization.application_key
    enterprise_app_id = each.value.datadog_organization.enterprise_app_id
    linking_auth_code = each.value.datadog_organization.linking_auth_code
    linking_client_id = each.value.datadog_organization.linking_client_id
    redirect_uri      = each.value.datadog_organization.redirect_uri
  }

  user {
    email        = each.value.user.email
    name         = each.value.user.name
    phone_number = each.value.user.phone_number
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type = identity.value.type
    }
  }
}

