# Production environment variables for storage-account module
name                       = "stprodexample001"
resource_group_name        = "rg-prod-example"
location                   = "eastus"
account_tier               = "Standard"
account_replication_type   = "GRS"
account_kind               = "StorageV2"
access_tier                = "Hot"
enable_https_traffic_only  = true
min_tls_version            = "TLS1_2"

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
