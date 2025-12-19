# Production environment variables for virtual-network module
name                = "vnet-prod-example"
location            = "eastus"
resource_group_name = "rg-prod-example"
address_space       = ["10.2.0.0/16"]
dns_servers         = []

subnets = {
  "subnet-default" = {
    address_prefixes  = ["10.2.1.0/24"]
    service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
  }
  "subnet-aks" = {
    address_prefixes  = ["10.2.2.0/24"]
    service_endpoints = ["Microsoft.ContainerRegistry"]
  }
}

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
