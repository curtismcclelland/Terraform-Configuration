# Staging environment variables for application-gateway module
name                = "appgw-stage-example"
resource_group_name = "rg-stage-example"
location            = "eastus"

sku = {
  name     = "Standard_v2"
  tier     = "Standard_v2"
  capacity = 2
}

subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-stage-example/providers/Microsoft.Network/virtualNetworks/vnet-stage/subnets/subnet-appgw"

frontend_port = {
  name = "https-port"
  port = 443
}

frontend_ip_configuration = {
  name                 = "frontend-ip"
  public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-stage-example/providers/Microsoft.Network/publicIPAddresses/pip-appgw-stage"
}

backend_http_settings = {
  name     = "backend-http-settings"
  port     = 443
  protocol = "Https"
}

http_listener = {
  name     = "https-listener"
  protocol = "Https"
}

request_routing_rule = {
  name     = "routing-rule"
  priority = 100
}

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
