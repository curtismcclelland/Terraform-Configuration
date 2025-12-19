# Azure Public IP Module

This module creates an Azure Public IP address.

## Usage

```hcl
module "public_ip" {
  source              = "./modules/public-ip"
  name                = "my-public-ip"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  allocation_method   = "Static"
  sku                 = "Standard"
  
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
| name | The name of the Public IP | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the Public IP will be created | string | n/a | yes |
| allocation_method | The allocation method (Static or Dynamic) | string | Static | no |
| sku | The SKU of the Public IP (Basic or Standard) | string | Standard | no |
| zones | Availability zones for the Public IP | list(string) | null | no |
| domain_name_label | Label for the Domain Name | string | null | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Public IP |
| name | The name of the Public IP |
| ip_address | The IP address value |
| fqdn | The fully qualified domain name |
