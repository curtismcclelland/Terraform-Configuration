output "id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.id
}

output "name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.name
}

output "private_ip_address" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.this.private_ip_address
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.this.id
}
