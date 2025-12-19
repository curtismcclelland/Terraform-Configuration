# Local values for resource group module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "resource-group"
    }
  )
}
