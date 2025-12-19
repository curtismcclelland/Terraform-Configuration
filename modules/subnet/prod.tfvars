# Production environment variables for subnet module
name                 = "subnet-prod-example"
resource_group_name  = "rg-prod-example"
virtual_network_name = "vnet-prod-example"
address_prefixes     = ["10.2.3.0/24"]
service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]

delegations = {}
