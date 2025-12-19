# Azure Resource Group Module

This module creates an Azure Resource Group.

## Usage

```hcl
module "resource_group" {
  source   = "./modules/resource-group"
  name     = "my-resource-group"
  location = "eastus"
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
| name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the resource group will be created | string | n/a | yes |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the resource group |
| name | The name of the resource group |
| location | The location of the resource group |
