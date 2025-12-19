# Production environment variables for container-registry module
name                = "acrprodexample001"
resource_group_name = "rg-prod-example"
location            = "eastus"
sku                 = "Premium"
admin_enabled       = false

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
