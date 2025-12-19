terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

resource "azurerm_application_gateway" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    capacity = lookup(var.sku, "capacity", null)
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = var.frontend_port.name
    port = var.frontend_port.port
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration.name
    public_ip_address_id = var.frontend_ip_configuration.public_ip_address_id
  }

  backend_address_pool {
    name = var.backend_address_pool_name
  }

  backend_http_settings {
    name                  = var.backend_http_settings.name
    cookie_based_affinity = lookup(var.backend_http_settings, "cookie_based_affinity", "Disabled")
    port                  = var.backend_http_settings.port
    protocol              = var.backend_http_settings.protocol
    request_timeout       = lookup(var.backend_http_settings, "request_timeout", 30)
  }

  http_listener {
    name                           = var.http_listener.name
    frontend_ip_configuration_name = var.frontend_ip_configuration.name
    frontend_port_name             = var.frontend_port.name
    protocol                       = var.http_listener.protocol
  }

  request_routing_rule {
    name                       = var.request_routing_rule.name
    rule_type                  = lookup(var.request_routing_rule, "rule_type", "Basic")
    http_listener_name         = var.http_listener.name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.backend_http_settings.name
    priority                   = var.request_routing_rule.priority
  }
}
