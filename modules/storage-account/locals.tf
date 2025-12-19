# Local values for storage-account module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "storage-account"
    }
  )
}
