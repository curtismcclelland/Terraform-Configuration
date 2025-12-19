# Staging environment variables for AKS module
name                = "aks-stage-example"
location            = "eastus"
resource_group_name = "rg-stage-example"
dns_prefix          = "aks-stage"
kubernetes_version  = "1.28"

default_node_pool = {
  name                = "default"
  node_count          = 3
  vm_size             = "Standard_D2s_v3"
  vnet_subnet_id      = null
  enable_auto_scaling = true
  min_count           = 2
  max_count           = 5
  os_disk_size_gb     = 30
  zones               = ["1", "2", "3"]
}

identity_type = "SystemAssigned"

network_profile = {
  network_plugin    = "azure"
  network_policy    = "azure"
  dns_service_ip    = "10.0.0.10"
  service_cidr      = "10.0.0.0/16"
  load_balancer_sku = "standard"
}

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
