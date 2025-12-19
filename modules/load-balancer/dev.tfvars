# Development environment variables for load-balancer module
name                = "lb-dev-example"
resource_group_name = "rg-dev-example"
location            = "eastus"
sku                 = "Standard"

frontend_ip_configurations = {
  "frontend-config" = {
    public_ip_address_id = null
  }
}

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
