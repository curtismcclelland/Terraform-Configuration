# Development environment variables for public-ip module
name              = "pip-dev-example"
resource_group_name = "rg-dev-example"
location          = "eastus"
allocation_method = "Static"
sku               = "Standard"
zones             = ["1", "2"]

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
