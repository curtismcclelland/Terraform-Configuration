# Azure Load Balancer Module

This module creates an Azure Load Balancer with backend pools, health probes, and load balancing rules.

## Usage

```hcl
module "load_balancer" {
  source              = "./modules/load-balancer"
  name                = "my-load-balancer"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  sku                 = "Standard"
  
  frontend_ip_configurations = {
    frontend = {
      public_ip_address_id = module.public_ip.id
    }
  }
  
  backend_address_pools = {
    backend = {}
  }
  
  probes = {
    http = {
      protocol     = "Http"
      port         = 80
      request_path = "/"
    }
  }
  
  lb_rules = {
    http = {
      protocol                       = "Tcp"
      frontend_port                  = 80
      backend_port                   = 80
      frontend_ip_configuration_name = "frontend"
      backend_address_pool_name      = "backend"
      probe_name                     = "http"
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
| name | The name of the Load Balancer | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the Load Balancer will be created | string | n/a | yes |
| frontend_ip_configurations | Map of frontend IP configurations | map(object) | n/a | yes |
| sku | The SKU of the Load Balancer (Basic or Standard) | string | Standard | no |
| sku_tier | The SKU tier (Regional or Global) | string | Regional | no |
| backend_address_pools | Map of backend address pool names | map(object) | {} | no |
| probes | Map of health probes | map(object) | {} | no |
| lb_rules | Map of load balancing rules | map(object) | {} | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Load Balancer |
| name | The name of the Load Balancer |
| frontend_ip_configuration | Frontend IP configuration details |
| backend_address_pool_ids | Map of backend address pool IDs |
| probe_ids | Map of probe IDs |
