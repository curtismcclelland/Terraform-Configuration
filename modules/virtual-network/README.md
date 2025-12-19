# Azure Virtual Network Module

This module creates an Azure Virtual Network with optional subnets.

## Usage

```hcl
module "virtual_network" {
  source              = "./modules/virtual-network"
  name                = "my-vnet"
  location            = "eastus"
  resource_group_name = "my-resource-group"
  address_space       = ["10.0.0.0/16"]
  
  subnets = {
    subnet1 = {
      address_prefixes = ["10.0.1.0/24"]
    }
    subnet2 = {
      address_prefixes  = ["10.0.2.0/24"]
      service_endpoints = ["Microsoft.Storage"]
    }
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
| name | The name of the virtual network | string | n/a | yes |
| location | The Azure region where the virtual network will be created | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| address_space | The address space for the virtual network | list(string) | n/a | yes |
| dns_servers | List of DNS servers | list(string) | [] | no |
| subnets | Map of subnets to create | map(object) | {} | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the virtual network |
| name | The name of the virtual network |
| address_space | The address space of the virtual network |
| subnet_ids | Map of subnet IDs |
