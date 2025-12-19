# Production environment variables for web-app module
name                = "webapp-prod-example"
service_plan_name   = "asp-prod-example"
resource_group_name = "rg-prod-example"
location            = "eastus"
os_type             = "Linux"
sku_name            = "P2v3"
https_only          = true
always_on           = true
minimum_tls_version = "1.2"

application_stack = {
  node_version = "18-lts"
}

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
