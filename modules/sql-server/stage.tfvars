# Staging environment variables for sql-server module
name                          = "sqlstage-example-001"
resource_group_name           = "rg-stage-example"
location                      = "eastus"
server_version                = "12.0"
administrator_login           = "sqladmin"
administrator_login_password  = "P@ssw0rd123!"  # Note: Use Azure Key Vault in production
minimum_tls_version           = "1.2"
public_network_access_enabled = false

databases = {
  "db-stage" = {
    sku_name    = "S1"
    max_size_gb = 10
  }
}

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
