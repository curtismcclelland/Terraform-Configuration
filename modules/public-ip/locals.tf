# Local values for public-ip module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "public-ip"
    }
  )
}
