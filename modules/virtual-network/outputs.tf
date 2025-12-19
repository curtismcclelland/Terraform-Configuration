output "id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.this.address_space
}

output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, v in azurerm_subnet.this : k => v.id }
}
