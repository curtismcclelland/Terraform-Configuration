# Azure Kubernetes Service (AKS) Module

This module creates an Azure Kubernetes Service cluster.

## Usage

```hcl
module "aks" {
  source              = "./modules/aks"
  name                = "my-aks-cluster"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  dns_prefix          = "myaks"
  
  default_node_pool = {
    name                = "default"
    vm_size             = "Standard_D2_v2"
    node_count          = 3
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 5
  }
  
  network_profile = {
    network_plugin = "azure"
    network_policy = "azure"
  }
  
  tags = {
    environment = "production"
  }
}
```

## Requirements

- Terraform >= 1.0
- azurerm provider ~> 4.0

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the AKS cluster | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the AKS cluster will be created | string | n/a | yes |
| dns_prefix | DNS prefix for the AKS cluster | string | n/a | yes |
| default_node_pool | Default node pool configuration | object | n/a | yes |
| kubernetes_version | The Kubernetes version | string | null | no |
| identity_type | The type of identity used for the managed cluster | string | SystemAssigned | no |
| network_profile | Network profile configuration | object | azure | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the AKS cluster |
| name | The name of the AKS cluster |
| kube_config | Kubernetes configuration (sensitive) |
| node_resource_group | The resource group containing the AKS cluster nodes |
| principal_id | The Principal ID of the System Assigned Managed Identity |
