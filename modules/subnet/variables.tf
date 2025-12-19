variable "name" {
  description = "The name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}

variable "service_endpoints" {
  description = "List of service endpoints"
  type        = list(string)
  default     = []
}

variable "delegations" {
  description = "Map of subnet delegations"
  type = map(object({
    service_name = string
    actions      = list(string)
  }))
  default = {}
}
