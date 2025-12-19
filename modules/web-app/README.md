# Azure Web App (App Service) Module

This module creates an Azure Web App with a Service Plan. Supports both Linux and Windows.

## Usage

```hcl
module "web_app" {
  source              = "./modules/web-app"
  name                = "my-web-app"
  service_plan_name   = "my-service-plan"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  os_type             = "Linux"
  sku_name            = "B1"
  
  application_stack = {
    node_version = "18-lts"
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
| name | The name of the web app | string | n/a | yes |
| service_plan_name | The name of the service plan | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the web app will be created | string | n/a | yes |
| os_type | The OS type for the service plan (Linux or Windows) | string | Linux | no |
| sku_name | The SKU name for the service plan | string | B1 | no |
| https_only | Force HTTPS only traffic | bool | true | no |
| always_on | Should the app be always on | bool | false | no |
| ftps_state | State of FTP / FTPS service | string | Disabled | no |
| minimum_tls_version | The minimum TLS version | string | 1.2 | no |
| application_stack | Application stack configuration | any | null | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the web app |
| name | The name of the web app |
| default_hostname | The default hostname of the web app |
| service_plan_id | The ID of the service plan |
