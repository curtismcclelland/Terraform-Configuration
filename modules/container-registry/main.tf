terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  
  dynamic "georeplications" {
    for_each = var.georeplications
    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = lookup(georeplications.value, "zone_redundancy_enabled", false)
      tags                    = lookup(georeplications.value, "tags", var.tags)
    }
  }
  
  network_rule_set {
    default_action = var.network_rule_set.default_action
    
    dynamic "ip_rule" {
      for_each = lookup(var.network_rule_set, "ip_rules", [])
      content {
        action   = "Allow"
        ip_range = ip_rule.value
      }
    }
    
    dynamic "virtual_network" {
      for_each = lookup(var.network_rule_set, "virtual_network_subnet_ids", [])
      content {
        action    = "Allow"
        subnet_id = virtual_network.value
      }
    }
  }
  
  tags = var.tags
}
