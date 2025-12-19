# Local values for application-gateway module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "application-gateway"
    }
  )
}
