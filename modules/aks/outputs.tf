output "id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.name
}

output "kube_config" {
  description = "Kubernetes configuration"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "node_resource_group" {
  description = "The resource group containing the AKS cluster nodes"
  value       = azurerm_kubernetes_cluster.this.node_resource_group
}

output "principal_id" {
  description = "The Principal ID of the System Assigned Managed Identity"
  value       = azurerm_kubernetes_cluster.this.identity[0].principal_id
}
