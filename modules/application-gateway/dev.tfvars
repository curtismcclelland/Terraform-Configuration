# Development environment variables for application-gateway module
name                = "appgw-dev-example"
resource_group_name = "rg-dev-example"
location            = "eastus"

sku = {
  name     = "Standard_v2"
  tier     = "Standard_v2"
  capacity = 2
}

subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-dev-example/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/subnet-appgw"

frontend_port = {
  name = "http-port"
  port = 80
}

frontend_ip_configuration = {
  name                 = "frontend-ip"
  public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-dev-example/providers/Microsoft.Network/publicIPAddresses/pip-appgw-dev"
}

backend_http_settings = {
  name     = "backend-http-settings"
  port     = 80
  protocol = "Http"
}

http_listener = {
  name     = "http-listener"
  protocol = "Http"
}

request_routing_rule = {
  name     = "routing-rule"
  priority = 100
}

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
