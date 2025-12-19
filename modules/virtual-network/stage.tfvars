# Staging environment variables for virtual-network module
name                = "vnet-stage-example"
location            = "eastus"
resource_group_name = "rg-stage-example"
address_space       = ["10.1.0.0/16"]
dns_servers         = []

subnets = {
  "subnet-default" = {
    address_prefixes  = ["10.1.1.0/24"]
    service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
  }
  "subnet-aks" = {
    address_prefixes  = ["10.1.2.0/24"]
    service_endpoints = ["Microsoft.ContainerRegistry"]
  }
}

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
