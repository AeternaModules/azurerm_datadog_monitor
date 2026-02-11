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
    monitoring_enabled  = optional(bool) # Default: true
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
}

