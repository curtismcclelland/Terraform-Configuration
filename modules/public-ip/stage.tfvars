# Staging environment variables for public-ip module
name              = "pip-stage-example"
resource_group_name = "rg-stage-example"
location          = "eastus"
allocation_method = "Static"
sku               = "Standard"
zones             = ["1", "2", "3"]

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
