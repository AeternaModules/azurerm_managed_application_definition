output "managed_application_definitions" {
  description = "All managed_application_definition resources"
  value       = azurerm_managed_application_definition.managed_application_definitions
}
output "managed_application_definitions_authorization" {
  description = "List of authorization values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.authorization]
}
output "managed_application_definitions_create_ui_definition" {
  description = "List of create_ui_definition values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.create_ui_definition]
}
output "managed_application_definitions_description" {
  description = "List of description values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.description]
}
output "managed_application_definitions_display_name" {
  description = "List of display_name values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.display_name]
}
output "managed_application_definitions_location" {
  description = "List of location values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.location]
}
output "managed_application_definitions_lock_level" {
  description = "List of lock_level values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.lock_level]
}
output "managed_application_definitions_main_template" {
  description = "List of main_template values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.main_template]
}
output "managed_application_definitions_name" {
  description = "List of name values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.name]
}
output "managed_application_definitions_package_enabled" {
  description = "List of package_enabled values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.package_enabled]
}
output "managed_application_definitions_package_file_uri" {
  description = "List of package_file_uri values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.package_file_uri]
}
output "managed_application_definitions_resource_group_name" {
  description = "List of resource_group_name values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.resource_group_name]
}
output "managed_application_definitions_tags" {
  description = "List of tags values across all managed_application_definitions"
  value       = [for k, v in azurerm_managed_application_definition.managed_application_definitions : v.tags]
}

