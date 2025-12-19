variable "name" {
  description = "The name of the Public IP"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the Public IP will be created"
  type        = string
}

variable "allocation_method" {
  description = "The allocation method (Static or Dynamic)"
  type        = string
  default     = "Static"
  validation {
    condition     = contains(["Static", "Dynamic"], var.allocation_method)
    error_message = "allocation_method must be either 'Static' or 'Dynamic'"
  }
}

variable "sku" {
  description = "The SKU of the Public IP (Basic or Standard)"
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Basic", "Standard"], var.sku)
    error_message = "sku must be either 'Basic' or 'Standard'"
  }
}

variable "zones" {
  description = "Availability zones for the Public IP"
  type        = list(string)
  default     = null
}

variable "domain_name_label" {
  description = "Label for the Domain Name"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
