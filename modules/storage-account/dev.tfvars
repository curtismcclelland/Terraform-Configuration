# Development environment variables for storage-account module
name                       = "stdevexample001"
resource_group_name        = "rg-dev-example"
location                   = "eastus"
account_tier               = "Standard"
account_replication_type   = "LRS"
account_kind               = "StorageV2"
access_tier                = "Hot"
enable_https_traffic_only  = true
min_tls_version            = "TLS1_2"

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
