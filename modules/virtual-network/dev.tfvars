# Development environment variables for virtual-network module
name                = "vnet-dev-example"
location            = "eastus"
resource_group_name = "rg-dev-example"
address_space       = ["10.0.0.0/16"]
dns_servers         = []

subnets = {
  "subnet-default" = {
    address_prefixes  = ["10.0.1.0/24"]
    service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
  }
  "subnet-aks" = {
    address_prefixes  = ["10.0.2.0/24"]
    service_endpoints = ["Microsoft.ContainerRegistry"]
  }
}

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
