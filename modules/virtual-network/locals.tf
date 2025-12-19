# Local values for virtual-network module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "virtual-network"
    }
  )
}
