# Staging environment variables for web-app module
name                = "webapp-stage-example"
service_plan_name   = "asp-stage-example"
resource_group_name = "rg-stage-example"
location            = "eastus"
os_type             = "Linux"
sku_name            = "P1v2"
https_only          = true
always_on           = true
minimum_tls_version = "1.2"

application_stack = {
  node_version = "18-lts"
}

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
