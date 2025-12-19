variable "name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be created"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version"
  type        = string
  default     = null
}

variable "identity_type" {
  description = "The type of identity used for the managed cluster"
  type        = string
  default     = "SystemAssigned"
}

variable "default_node_pool" {
  description = "Default node pool configuration"
  type = object({
    name                = string
    vm_size             = string
    node_count          = optional(number)
    vnet_subnet_id      = optional(string)
    enable_auto_scaling = optional(bool, false)
    min_count           = optional(number)
    max_count           = optional(number)
    os_disk_size_gb     = optional(number)
    zones               = optional(list(string))
  })
}

variable "network_profile" {
  description = "Network profile configuration"
  type = object({
    network_plugin    = string
    network_policy    = optional(string)
    dns_service_ip    = optional(string)
    service_cidr      = optional(string)
    load_balancer_sku = optional(string, "standard")
  })
  default = {
    network_plugin = "azure"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
