# Development environment variables for sql-server module
name                          = "sqldev-example-001"
resource_group_name           = "rg-dev-example"
location                      = "eastus"
server_version                = "12.0"
administrator_login           = "sqladmin"
administrator_login_password  = "P@ssw0rd123!"  # Note: Use Azure Key Vault in production
minimum_tls_version           = "1.2"
public_network_access_enabled = false

databases = {
  "db-dev" = {
    sku_name    = "Basic"
    max_size_gb = 2
  }
}

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
