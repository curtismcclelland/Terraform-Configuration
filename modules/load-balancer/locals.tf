# Local values for load-balancer module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "load-balancer"
    }
  )
}
