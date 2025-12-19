# Production environment variables for key-vault module
name                         = "kv-prod-example-001"
resource_group_name          = "rg-prod-example"
location                     = "eastus"
sku_name                     = "premium"
soft_delete_retention_days   = 90
purge_protection_enabled     = true
enable_rbac_authorization    = true

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
