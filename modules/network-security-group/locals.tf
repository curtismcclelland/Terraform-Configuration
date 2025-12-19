# Local values for network-security-group module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "network-security-group"
    }
  )
}
