output "managed_application_definitions_id" {
  description = "Map of id values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.id }
}
output "managed_application_definitions_authorization" {
  description = "Map of authorization values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.authorization }
}
output "managed_application_definitions_create_ui_definition" {
  description = "Map of create_ui_definition values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.create_ui_definition }
}
output "managed_application_definitions_description" {
  description = "Map of description values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.description }
}
output "managed_application_definitions_display_name" {
  description = "Map of display_name values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.display_name }
}
output "managed_application_definitions_location" {
  description = "Map of location values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.location }
}
output "managed_application_definitions_lock_level" {
  description = "Map of lock_level values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.lock_level }
}
output "managed_application_definitions_main_template" {
  description = "Map of main_template values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.main_template }
}
output "managed_application_definitions_name" {
  description = "Map of name values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.name }
}
output "managed_application_definitions_package_enabled" {
  description = "Map of package_enabled values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.package_enabled }
}
output "managed_application_definitions_package_file_uri" {
  description = "Map of package_file_uri values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.package_file_uri }
}
output "managed_application_definitions_resource_group_name" {
  description = "Map of resource_group_name values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.resource_group_name }
}
output "managed_application_definitions_tags" {
  description = "Map of tags values across all managed_application_definitions, keyed the same as var.managed_application_definitions"
  value       = { for k, v in azurerm_managed_application_definition.managed_application_definitions : k => v.tags }
}

