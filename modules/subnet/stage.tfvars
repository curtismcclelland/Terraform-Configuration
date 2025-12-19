# Staging environment variables for subnet module
name                 = "subnet-stage-example"
resource_group_name  = "rg-stage-example"
virtual_network_name = "vnet-stage-example"
address_prefixes     = ["10.1.3.0/24"]
service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]

delegations = {}
