# Azure Container Registry Module

This module creates an Azure Container Registry.

## Usage

```hcl
module "container_registry" {
  source              = "./modules/container-registry"
  name                = "mycontainerregistry"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  sku                 = "Standard"
  admin_enabled       = true
  
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
| name | The name of the Container Registry | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the Container Registry will be created | string | n/a | yes |
| sku | The SKU name for the Container Registry | string | Basic | no |
| admin_enabled | Whether admin user is enabled | bool | false | no |
| georeplications | List of georeplications (Premium SKU only) | list(object) | [] | no |
| network_rule_set | Network rule set configuration | object | default Allow | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Container Registry |
| name | The name of the Container Registry |
| login_server | The URL for the Container Registry login server |
| admin_username | The admin username for the Container Registry |
| admin_password | The admin password for the Container Registry (sensitive) |
