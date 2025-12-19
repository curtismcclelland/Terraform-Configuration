# Local values for key-vault module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "key-vault"
    }
  )
}
