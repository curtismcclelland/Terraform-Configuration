# Azure Network Security Group Module

This module creates an Azure Network Security Group with optional security rules.

## Usage

```hcl
module "nsg" {
  source              = "./modules/network-security-group"
  name                = "my-nsg"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  
  security_rules = {
    allow_ssh = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    allow_https = {
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      destination_port_ranges    = ["443", "8443"]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
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
| name | The name of the Network Security Group | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the NSG will be created | string | n/a | yes |
| security_rules | Map of security rules to create | map(object) | {} | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Network Security Group |
| name | The name of the Network Security Group |
