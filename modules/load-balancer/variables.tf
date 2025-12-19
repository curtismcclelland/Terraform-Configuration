variable "name" {
  description = "The name of the Load Balancer"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the Load Balancer will be created"
  type        = string
}

variable "sku" {
  description = "The SKU of the Load Balancer (Basic or Standard)"
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Basic", "Standard"], var.sku)
    error_message = "sku must be either 'Basic' or 'Standard'"
  }
}

variable "sku_tier" {
  description = "The SKU tier (Regional or Global)"
  type        = string
  default     = "Regional"
}

variable "frontend_ip_configurations" {
  description = "Map of frontend IP configurations"
  type = map(object({
    public_ip_address_id          = optional(string)
    subnet_id                     = optional(string)
    private_ip_address            = optional(string)
    private_ip_address_allocation = optional(string)
    zones                         = optional(list(string))
  }))
}

variable "backend_address_pools" {
  description = "Map of backend address pool names"
  type        = map(object({}))
  default     = {}
}

variable "probes" {
  description = "Map of health probes"
  type = map(object({
    protocol            = string
    port                = number
    request_path        = optional(string)
    interval_in_seconds = optional(number)
    number_of_probes    = optional(number)
  }))
  default = {}
}

variable "lb_rules" {
  description = "Map of load balancing rules"
  type = map(object({
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
    backend_address_pool_name      = string
    probe_name                     = optional(string)
    enable_floating_ip             = optional(bool)
    idle_timeout_in_minutes        = optional(number)
  }))
  default = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
