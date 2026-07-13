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
    package_enabled      = optional(bool)
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
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        v.authorization == null || alltrue([for item in v.authorization : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.role_definition_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        v.authorization == null || alltrue([for item in v.authorization : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.service_principal_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        v.create_ui_definition == null || (can(jsondecode(v.create_ui_definition)))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        v.description == null || (length(v.description) <= 200)
      )
    ])
    error_message = "[from validate.ApplicationDefinitionDescription: invalid when len(value) > 200]"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        v.main_template == null || (can(jsondecode(v.main_template)))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_application_definitions : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

