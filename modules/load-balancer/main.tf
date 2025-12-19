terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

resource "azurerm_lb" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  sku_tier            = var.sku_tier
  tags                = var.tags

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configurations
    content {
      name                          = frontend_ip_configuration.key
      public_ip_address_id          = lookup(frontend_ip_configuration.value, "public_ip_address_id", null)
      subnet_id                     = lookup(frontend_ip_configuration.value, "subnet_id", null)
      private_ip_address            = lookup(frontend_ip_configuration.value, "private_ip_address", null)
      private_ip_address_allocation = lookup(frontend_ip_configuration.value, "private_ip_address_allocation", "Dynamic")
      zones                         = lookup(frontend_ip_configuration.value, "zones", null)
    }
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  for_each = var.backend_address_pools

  name            = each.key
  loadbalancer_id = azurerm_lb.this.id
}

resource "azurerm_lb_probe" "this" {
  for_each = var.probes

  name                = each.key
  loadbalancer_id     = azurerm_lb.this.id
  protocol            = each.value.protocol
  port                = each.value.port
  request_path        = lookup(each.value, "request_path", null)
  interval_in_seconds = lookup(each.value, "interval_in_seconds", 15)
  number_of_probes    = lookup(each.value, "number_of_probes", 2)
}

resource "azurerm_lb_rule" "this" {
  for_each = var.lb_rules

  name                           = each.key
  loadbalancer_id                = azurerm_lb.this.id
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this[each.value.backend_address_pool_name].id]
  probe_id                       = lookup(each.value, "probe_name", null) != null ? azurerm_lb_probe.this[each.value.probe_name].id : null
  enable_floating_ip             = lookup(each.value, "enable_floating_ip", false)
  idle_timeout_in_minutes        = lookup(each.value, "idle_timeout_in_minutes", 4)
}
