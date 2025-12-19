terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  
  default_node_pool {
    name                = var.default_node_pool.name
    node_count          = lookup(var.default_node_pool, "node_count", null)
    vm_size             = var.default_node_pool.vm_size
    vnet_subnet_id      = lookup(var.default_node_pool, "vnet_subnet_id", null)
    enable_auto_scaling = lookup(var.default_node_pool, "enable_auto_scaling", false)
    min_count           = lookup(var.default_node_pool, "min_count", null)
    max_count           = lookup(var.default_node_pool, "max_count", null)
    os_disk_size_gb     = lookup(var.default_node_pool, "os_disk_size_gb", null)
    type                = "VirtualMachineScaleSets"
    zones               = lookup(var.default_node_pool, "zones", null)
  }

  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin    = var.network_profile.network_plugin
    network_policy    = lookup(var.network_profile, "network_policy", null)
    dns_service_ip    = lookup(var.network_profile, "dns_service_ip", null)
    service_cidr      = lookup(var.network_profile, "service_cidr", null)
    load_balancer_sku = lookup(var.network_profile, "load_balancer_sku", "standard")
  }

  tags = var.tags
}
