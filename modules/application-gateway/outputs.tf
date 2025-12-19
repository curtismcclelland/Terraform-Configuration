output "id" {
  description = "The ID of the Application Gateway"
  value       = azurerm_application_gateway.this.id
}

output "name" {
  description = "The name of the Application Gateway"
  value       = azurerm_application_gateway.this.name
}

output "backend_address_pool" {
  description = "Backend address pool details"
  value       = azurerm_application_gateway.this.backend_address_pool
}

output "frontend_ip_configuration" {
  description = "Frontend IP configuration details"
  value       = azurerm_application_gateway.this.frontend_ip_configuration
}
