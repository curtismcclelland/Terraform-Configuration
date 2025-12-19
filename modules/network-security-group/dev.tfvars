# Development environment variables for network-security-group module
name                = "nsg-dev-example"
resource_group_name = "rg-dev-example"
location            = "eastus"

security_rules = {
  "allow_ssh" = {
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
