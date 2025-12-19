# Local values for AKS module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "aks"
    }
  )
}
