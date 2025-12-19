# Azure Key Vault Module

This module creates an Azure Key Vault with optional access policies.

## Usage

```hcl
module "key_vault" {
  source              = "./modules/key-vault"
  name                = "my-key-vault"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  sku_name            = "standard"
  
  access_policies = {
    policy1 = {
      object_id = "00000000-0000-0000-0000-000000000000"
      key_permissions = [
        "Get", "List", "Create"
      ]
      secret_permissions = [
        "Get", "List", "Set"
      ]
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
| name | The name of the Key Vault | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the Key Vault will be created | string | n/a | yes |
| sku_name | The SKU name for the Key Vault | string | standard | no |
| soft_delete_retention_days | The number of days to retain soft-deleted items | number | 90 | no |
| purge_protection_enabled | Whether purge protection is enabled | bool | false | no |
| enabled_for_deployment | Whether Azure Virtual Machines are permitted to retrieve certificates | bool | false | no |
| enabled_for_disk_encryption | Whether Azure Disk Encryption is permitted to retrieve secrets | bool | false | no |
| enabled_for_template_deployment | Whether Azure Resource Manager is permitted to retrieve secrets | bool | false | no |
| enable_rbac_authorization | Whether to use RBAC for authorization | bool | false | no |
| network_acls | Network ACL configuration | object | default Allow | no |
| access_policies | Map of access policies to create | map(object) | {} | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Key Vault |
| name | The name of the Key Vault |
| vault_uri | The URI of the Key Vault |
| tenant_id | The tenant ID of the Key Vault |
