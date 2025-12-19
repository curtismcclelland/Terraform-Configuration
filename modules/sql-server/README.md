# Azure SQL Server Module

This module creates an Azure SQL Server with optional databases and firewall rules.

## Usage

```hcl
module "sql_server" {
  source                       = "./modules/sql-server"
  name                         = "my-sql-server"
  resource_group_name          = "my-resource-group"
  location                     = "eastus"
  administrator_login          = "sqladmin"
  administrator_login_password = var.sql_admin_password
  
  databases = {
    db1 = {
      sku_name = "Basic"
    }
    db2 = {
      sku_name    = "S0"
      max_size_gb = 10
    }
  }
  
  firewall_rules = {
    AllowAzureServices = {
      start_ip_address = "0.0.0.0"
      end_ip_address   = "0.0.0.0"
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
| name | The name of the SQL Server | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the SQL Server will be created | string | n/a | yes |
| administrator_login | The administrator login for the SQL Server | string | n/a | yes |
| administrator_login_password | The administrator login password for the SQL Server | string | n/a | yes |
| server_version | The version of the SQL Server | string | 12.0 | no |
| minimum_tls_version | The minimum TLS version | string | 1.2 | no |
| public_network_access_enabled | Whether public network access is enabled | bool | false | no |
| databases | Map of databases to create | map(object) | {} | no |
| firewall_rules | Map of firewall rules to create | map(object) | {} | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the SQL Server |
| name | The name of the SQL Server |
| fully_qualified_domain_name | The fully qualified domain name of the SQL Server |
| database_ids | Map of database IDs |
