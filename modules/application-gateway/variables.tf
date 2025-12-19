variable "name" {
  description = "The name of the Application Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the Application Gateway will be created"
  type        = string
}

variable "sku" {
  description = "SKU configuration for the Application Gateway"
  type = object({
    name     = string
    tier     = string
    capacity = optional(number)
  })
  default = {
    name = "Standard_v2"
    tier = "Standard_v2"
  }
}

variable "subnet_id" {
  description = "The ID of the subnet for the Application Gateway"
  type        = string
}

variable "gateway_ip_configuration_name" {
  description = "The name of the gateway IP configuration"
  type        = string
  default     = "gateway-ip-config"
}

variable "frontend_port" {
  description = "Frontend port configuration"
  type = object({
    name = string
    port = number
  })
}

variable "frontend_ip_configuration" {
  description = "Frontend IP configuration"
  type = object({
    name                 = string
    public_ip_address_id = string
  })
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool"
  type        = string
  default     = "backend-pool"
}

variable "backend_http_settings" {
  description = "Backend HTTP settings configuration"
  type = object({
    name                  = string
    port                  = number
    protocol              = string
    cookie_based_affinity = optional(string, "Disabled")
    request_timeout       = optional(number, 30)
  })
}

variable "http_listener" {
  description = "HTTP listener configuration"
  type = object({
    name     = string
    protocol = string
  })
}

variable "request_routing_rule" {
  description = "Request routing rule configuration"
  type = object({
    name      = string
    rule_type = optional(string, "Basic")
    priority  = number
  })
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
