variable "datadog_monitors" {
  description = <<EOT
Map of datadog_monitors, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - datadog_organization (block):
        - api_key (required)
        - application_key (required)
        - enterprise_app_id (optional)
        - linking_auth_code (optional)
        - linking_client_id (optional)
        - redirect_uri (optional)
    - user (block):
        - email (required)
        - name (required)
        - phone_number (optional)
Optional:
    - monitoring_enabled
    - tags
    - identity (block):
        - type (required)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    sku_name            = string
    monitoring_enabled  = optional(bool)
    tags                = optional(map(string))
    datadog_organization = object({
      api_key           = string
      application_key   = string
      enterprise_app_id = optional(string)
      linking_auth_code = optional(string)
      linking_client_id = optional(string)
      redirect_uri      = optional(string)
    })
    user = object({
      email        = string
      name         = string
      phone_number = optional(string)
    })
    identity = optional(object({
      type = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.datadog_monitors : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.datadog_monitors : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.datadog_monitors : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.datadog_monitors : (
        length(v.user.name) != 0
      )
    ])
    error_message = "[from validate.DatadogUsersName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.datadog_monitors : (
        length(v.user.name) <= 50
      )
    ])
    error_message = "[from validate.DatadogUsersName: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.datadog_monitors : (
        v.user.phone_number == null || (length(v.user.phone_number) <= 40)
      )
    ])
    error_message = "[from validate.DatadogMonitorsPhoneNumber: invalid when len(value) > 40]"
  }
  validation {
    condition = alltrue([
      for k, v in var.datadog_monitors : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

