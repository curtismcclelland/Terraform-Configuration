# Production environment variables for load-balancer module
name                = "lb-prod-example"
resource_group_name = "rg-prod-example"
location            = "eastus"
sku                 = "Standard"

frontend_ip_configurations = {
  "frontend-config" = {
    public_ip_address_id = null
  }
}

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
