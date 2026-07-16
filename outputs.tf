output "managed_application_definitions_id" {
  description = "Map of id values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "managed_application_definitions_authorization" {
  description = "Map of authorization values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.authorization if v.authorization != null && length(v.authorization) > 0 }
}
output "managed_application_definitions_create_ui_definition" {
  description = "Map of create_ui_definition values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.create_ui_definition if v.create_ui_definition != null && length(v.create_ui_definition) > 0 }
}
output "managed_application_definitions_description" {
  description = "Map of description values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.description if v.description != null && length(v.description) > 0 }
}
output "managed_application_definitions_display_name" {
  description = "Map of display_name values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "managed_application_definitions_location" {
  description = "Map of location values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.location if v.location != null && length(v.location) > 0 }
}
output "managed_application_definitions_lock_level" {
  description = "Map of lock_level values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.lock_level if v.lock_level != null && length(v.lock_level) > 0 }
}
output "managed_application_definitions_main_template" {
  description = "Map of main_template values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.main_template if v.main_template != null && length(v.main_template) > 0 }
}
output "managed_application_definitions_name" {
  description = "Map of name values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.name if v.name != null && length(v.name) > 0 }
}
output "managed_application_definitions_package_enabled" {
  description = "Map of package_enabled values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.package_enabled if v.package_enabled != null }
}
output "managed_application_definitions_package_file_uri" {
  description = "Map of package_file_uri values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.package_file_uri if v.package_file_uri != null && length(v.package_file_uri) > 0 }
}
output "managed_application_definitions_resource_group_name" {
  description = "Map of resource_group_name values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "managed_application_definitions_tags" {
  description = "Map of tags values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

