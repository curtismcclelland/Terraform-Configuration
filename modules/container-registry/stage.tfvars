# Staging environment variables for container-registry module
name                = "acrstageexample001"
resource_group_name = "rg-stage-example"
location            = "eastus"
sku                 = "Standard"
admin_enabled       = false

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
