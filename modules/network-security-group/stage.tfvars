# Staging environment variables for network-security-group module
name                = "nsg-stage-example"
resource_group_name = "rg-stage-example"
location            = "eastus"

security_rules = {
  "allow_https" = {
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
