# Local values for web-app module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "web-app"
    }
  )
}
