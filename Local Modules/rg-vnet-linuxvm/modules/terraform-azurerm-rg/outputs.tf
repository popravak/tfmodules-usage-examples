
output "rg_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}

output "location" {
  description = "Location"
  value       = azurerm_resource_group.rg.location
}
