# Local values for container-registry module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "container-registry"
    }
  )
}
