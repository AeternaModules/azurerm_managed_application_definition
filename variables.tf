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
}

