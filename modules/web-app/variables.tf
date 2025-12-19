variable "name" {
  description = "The name of the web app"
  type        = string
}

variable "service_plan_name" {
  description = "The name of the service plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the web app will be created"
  type        = string
}

variable "os_type" {
  description = "The OS type for the service plan (Linux or Windows)"
  type        = string
  default     = "Linux"
  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "os_type must be either 'Linux' or 'Windows'"
  }
}

variable "sku_name" {
  description = "The SKU name for the service plan"
  type        = string
  default     = "B1"
}

variable "https_only" {
  description = "Force HTTPS only traffic"
  type        = bool
  default     = true
}

variable "always_on" {
  description = "Should the app be always on"
  type        = bool
  default     = false
}

variable "ftps_state" {
  description = "State of FTP / FTPS service"
  type        = string
  default     = "Disabled"
}

variable "minimum_tls_version" {
  description = "The minimum TLS version"
  type        = string
  default     = "1.2"
}

variable "application_stack" {
  description = "Application stack configuration (structure varies by OS type)"
  type        = any
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
