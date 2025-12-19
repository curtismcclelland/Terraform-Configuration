variable "name" {
  description = "The name of the Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the Container Registry will be created"
  type        = string
}

variable "sku" {
  description = "The SKU name for the Container Registry"
  type        = string
  default     = "Basic"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be Basic, Standard, or Premium"
  }
}

variable "admin_enabled" {
  description = "Whether admin user is enabled"
  type        = bool
  default     = false
}

variable "georeplications" {
  description = "List of georeplications for the Container Registry (only supported with Premium SKU)"
  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool, false)
    tags                    = optional(map(string))
  }))
  default = []
}

variable "network_rule_set" {
  description = "Network rule set configuration"
  type = object({
    default_action            = string
    ip_rules                  = optional(list(string))
    virtual_network_subnet_ids = optional(list(string))
  })
  default = {
    default_action = "Allow"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
