# Local values for sql-server module
locals {
  common_tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "sql-server"
    }
  )
}
