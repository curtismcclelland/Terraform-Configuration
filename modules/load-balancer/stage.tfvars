# Staging environment variables for load-balancer module
name                = "lb-stage-example"
resource_group_name = "rg-stage-example"
location            = "eastus"
sku                 = "Standard"

frontend_ip_configurations = {
  "frontend-config" = {
    public_ip_address_id = null
  }
}

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
