resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled

  lifecycle {
    precondition {
      condition     = length(var.georeplications) == 0 || var.sku == "Premium"
      error_message = "Georeplications are only supported with Premium SKU container registry"
    }
  }

  dynamic "georeplications" {
    for_each = var.georeplications
    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
      tags                    = georeplications.value.tags != null ? georeplications.value.tags : var.tags
    }
  }

  public_network_access_enabled = var.network_rule_set.default_action == "Allow"

  dynamic "network_rule_set" {
    for_each = var.network_rule_set.default_action == "Deny" ? [1] : []
    content {
      default_action = "Deny"

      dynamic "ip_rule" {
        for_each = var.network_rule_set.ip_rules != null ? var.network_rule_set.ip_rules : []
        content {
          action   = "Allow"
          ip_range = ip_rule.value
        }
      }
    }
  }

  tags = local.common_tags
}
