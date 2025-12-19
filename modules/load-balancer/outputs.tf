output "id" {
  description = "The ID of the Load Balancer"
  value       = azurerm_lb.this.id
}

output "name" {
  description = "The name of the Load Balancer"
  value       = azurerm_lb.this.name
}

output "frontend_ip_configuration" {
  description = "Frontend IP configuration details"
  value       = azurerm_lb.this.frontend_ip_configuration
}

output "backend_address_pool_ids" {
  description = "Map of backend address pool IDs"
  value       = { for k, v in azurerm_lb_backend_address_pool.this : k => v.id }
}

output "probe_ids" {
  description = "Map of probe IDs"
  value       = { for k, v in azurerm_lb_probe.this : k => v.id }
}
