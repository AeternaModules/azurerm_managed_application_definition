variable "managed_application_definitions" {
  description = <<EOT
Map of managed_application_definitions, attributes below
Required:
    - display_name
    - location
    - lock_level
    - name
    - resource_group_name
Optional:
    - create_ui_definition
    - description
    - main_template
    - package_enabled
    - package_file_uri
    - tags
    - authorization (block):
        - role_definition_id (required)
        - service_principal_id (required)
EOT

  type = map(object({
    display_name         = string
    location             = string
    lock_level           = string
    name                 = string
    resource_group_name  = string
    create_ui_definition = optional(string)
    description          = optional(string)
    main_template        = optional(string)
    package_enabled      = optional(bool) # Default: true
    package_file_uri     = optional(string)
    tags                 = optional(map(string))
    authorization = optional(list(object({
      role_definition_id   = string
      service_principal_id = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        v.authorization == null || (length(v.authorization) >= 1)
      )
    ])
    error_message = "Each authorization list must contain at least 1 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_managed_application_definition's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ApplicationDefinitionName] !regexp.MustCompile(`^[^\W_]{3,64}$`).MatchString(value)
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
  # path: display_name
  #   source:    [from validate.ApplicationDefinitionDisplayName] len(value) < 4 || len(value) > 60
  # path: lock_level
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: authorization.role_definition_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: authorization.service_principal_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: create_ui_definition
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: description
  #   condition: length(value) <= 200
  #   message:   [from validate.ApplicationDefinitionDescription: invalid when len(value) > 200]
  #   source:    [from validate.ApplicationDefinitionDescription: invalid when len(value) > 200]
  # path: main_template
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: package_file_uri
  #   source:    validation.IsURLWithHTTPorHTTPS(...) - no translation rule yet, add one
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

