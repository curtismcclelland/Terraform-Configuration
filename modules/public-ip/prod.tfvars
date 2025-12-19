# Production environment variables for public-ip module
name              = "pip-prod-example"
resource_group_name = "rg-prod-example"
location          = "eastus"
allocation_method = "Static"
sku               = "Standard"
zones             = ["1", "2", "3"]

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
