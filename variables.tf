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
  # --- Unconfirmed validation candidates, derived from azurerm_datadog_monitor's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.DatadogMonitorsName] !ok
  # path: name
  #   source:    [from validate.DatadogMonitorsName] !regexp.MustCompile(`^[a-zA-Z0-9_-]{2,32}$`).MatchString(v)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: user.name
  #   source:    [from validate.DatadogUsersName] !ok
  # path: user.name
  #   condition: length(value) != 0
  #   message:   [from validate.DatadogUsersName: invalid when len(value) == 0]
  #   source:    [from validate.DatadogUsersName: invalid when len(value) == 0]
  # path: user.name
  #   condition: length(value) <= 50
  #   message:   [from validate.DatadogUsersName: invalid when len(value) > 50]
  #   source:    [from validate.DatadogUsersName: invalid when len(value) > 50]
  # path: user.email
  #   source:    [from validate.DatadogMonitorsEmailAddress] !ok
  # path: user.email
  #   source:    [from validate.DatadogMonitorsEmailAddress] !regexp.MustCompile(`^[A-Za-z0-9._%+-]+@(?:[A-Za-z0-9-]+\.)+[A-Za-z]{2,}$`).MatchString(v)
  # path: user.phone_number
  #   source:    [from validate.DatadogMonitorsPhoneNumber] !ok
  # path: user.phone_number
  #   condition: length(value) <= 40
  #   message:   [from validate.DatadogMonitorsPhoneNumber: invalid when len(value) > 40]
  #   source:    [from validate.DatadogMonitorsPhoneNumber: invalid when len(value) > 40]
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

