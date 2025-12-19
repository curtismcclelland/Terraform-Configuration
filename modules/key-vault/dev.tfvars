# Development environment variables for key-vault module
name                         = "kv-dev-example-001"
resource_group_name          = "rg-dev-example"
location                     = "eastus"
sku_name                     = "standard"
soft_delete_retention_days   = 90
purge_protection_enabled     = false
enable_rbac_authorization    = true

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
