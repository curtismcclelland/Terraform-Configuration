# Azure Storage Account Module

This module creates an Azure Storage Account.

## Usage

```hcl
module "storage_account" {
  source                   = "./modules/storage-account"
  name                     = "mystorageaccount"
  resource_group_name      = "my-resource-group"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
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
| name | The name of the storage account | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the storage account will be created | string | n/a | yes |
| account_tier | The performance tier of the storage account | string | Standard | no |
| account_replication_type | The replication type for the storage account | string | LRS | no |
| account_kind | The kind of storage account | string | StorageV2 | no |
| access_tier | The access tier for the storage account | string | Hot | no |
| enable_https_traffic_only | Enable HTTPS traffic only | bool | true | no |
| min_tls_version | The minimum TLS version | string | TLS1_2 | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the storage account |
| name | The name of the storage account |
| primary_blob_endpoint | The primary blob endpoint |
| primary_access_key | The primary access key (sensitive) |
| primary_connection_string | The primary connection string (sensitive) |
