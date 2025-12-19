# Development environment variables for web-app module
name                = "webapp-dev-example"
service_plan_name   = "asp-dev-example"
resource_group_name = "rg-dev-example"
location            = "eastus"
os_type             = "Linux"
sku_name            = "B1"
https_only          = true
always_on           = false
minimum_tls_version = "1.2"

application_stack = {
  node_version = "18-lts"
}

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
