# Development environment variables for subnet module
name                 = "subnet-dev-example"
resource_group_name  = "rg-dev-example"
virtual_network_name = "vnet-dev-example"
address_prefixes     = ["10.0.3.0/24"]
service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]

delegations = {}
