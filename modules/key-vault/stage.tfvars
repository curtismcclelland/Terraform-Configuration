# Staging environment variables for key-vault module
name                         = "kv-stage-example-001"
resource_group_name          = "rg-stage-example"
location                     = "eastus"
sku_name                     = "standard"
soft_delete_retention_days   = 90
purge_protection_enabled     = true
enable_rbac_authorization    = true

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
