# Azure Subnet Module

This module creates an Azure subnet within a virtual network.

## Usage

```hcl
module "subnet" {
  source = "./modules/subnet"

  name                 = "subnet-example"
  resource_group_name  = "rg-example"
  virtual_network_name = "vnet-example"
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
}
```

## Features

- Creates a subnet within an existing virtual network
- Supports service endpoints
- Supports subnet delegations
- Integrates with Azure AD authentication for backend state

## Requirements

- Terraform >= 1.5.0
- AzureRM provider ~> 4.0
