# Azure Application Gateway Module

This module creates an Azure Application Gateway.

## Usage

```hcl
module "application_gateway" {
  source              = "./modules/application-gateway"
  name                = "my-app-gateway"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  subnet_id           = module.virtual_network.subnet_ids["gateway-subnet"]
  
  sku = {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }
  
  frontend_port = {
    name = "frontend-port"
    port = 80
  }
  
  frontend_ip_configuration = {
    name                 = "frontend-ip"
    public_ip_address_id = module.public_ip.id
  }
  
  backend_http_settings = {
    name     = "backend-http-settings"
    port     = 80
    protocol = "Http"
  }
  
  http_listener = {
    name     = "http-listener"
    protocol = "Http"
  }
  
  request_routing_rule = {
    name     = "routing-rule"
    priority = 100
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
| name | The name of the Application Gateway | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the Application Gateway will be created | string | n/a | yes |
| subnet_id | The ID of the subnet for the Application Gateway | string | n/a | yes |
| frontend_port | Frontend port configuration | object | n/a | yes |
| frontend_ip_configuration | Frontend IP configuration | object | n/a | yes |
| backend_http_settings | Backend HTTP settings configuration | object | n/a | yes |
| http_listener | HTTP listener configuration | object | n/a | yes |
| request_routing_rule | Request routing rule configuration | object | n/a | yes |
| sku | SKU configuration for the Application Gateway | object | Standard_v2 | no |
| gateway_ip_configuration_name | The name of the gateway IP configuration | string | gateway-ip-config | no |
| backend_address_pool_name | The name of the backend address pool | string | backend-pool | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Application Gateway |
| name | The name of the Application Gateway |
| backend_address_pool | Backend address pool details |
| frontend_ip_configuration | Frontend IP configuration details |
