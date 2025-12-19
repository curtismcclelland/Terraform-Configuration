# Local values for virtual-machine-linux module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "virtual-machine-linux"
    }
  )
}
