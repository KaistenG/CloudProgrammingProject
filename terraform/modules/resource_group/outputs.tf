output "name" {
  value       = azurerm_resource_group.rg.name
  description = "Name der erstellten Ressourcengruppe"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "Location der erstellten Ressourcengruppe"
}