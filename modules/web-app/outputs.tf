output "id" {
  description = "The ID of the web app"
  value       = var.os_type == "Linux" ? azurerm_linux_web_app.this[0].id : azurerm_windows_web_app.this[0].id
}

output "name" {
  description = "The name of the web app"
  value       = var.os_type == "Linux" ? azurerm_linux_web_app.this[0].name : azurerm_windows_web_app.this[0].name
}

output "default_hostname" {
  description = "The default hostname of the web app"
  value       = var.os_type == "Linux" ? azurerm_linux_web_app.this[0].default_hostname : azurerm_windows_web_app.this[0].default_hostname
}

output "service_plan_id" {
  description = "The ID of the service plan"
  value       = azurerm_service_plan.this.id
}
