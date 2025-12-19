# Local values for virtual-machine-windows module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "virtual-machine-windows"
    }
  )
}
