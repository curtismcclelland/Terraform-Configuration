# Development environment variables for container-registry module
name                = "acrdevexample001"
resource_group_name = "rg-dev-example"
location            = "eastus"
sku                 = "Basic"
admin_enabled       = false

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
