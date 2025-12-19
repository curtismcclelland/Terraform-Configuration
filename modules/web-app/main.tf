terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

resource "azurerm_service_plan" "this" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "this" {
  count               = var.os_type == "Linux" ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id
  https_only          = var.https_only
  tags                = var.tags

  site_config {
    always_on         = var.always_on
    ftps_state        = var.ftps_state
    minimum_tls_version = var.minimum_tls_version
    
    dynamic "application_stack" {
      for_each = var.application_stack != null ? [var.application_stack] : []
      content {
        docker_image_name   = lookup(application_stack.value, "docker_image_name", null)
        docker_registry_url = lookup(application_stack.value, "docker_registry_url", null)
        dotnet_version      = lookup(application_stack.value, "dotnet_version", null)
        java_version        = lookup(application_stack.value, "java_version", null)
        node_version        = lookup(application_stack.value, "node_version", null)
        php_version         = lookup(application_stack.value, "php_version", null)
        python_version      = lookup(application_stack.value, "python_version", null)
      }
    }
  }
}

resource "azurerm_windows_web_app" "this" {
  count               = var.os_type == "Windows" ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id
  https_only          = var.https_only
  tags                = var.tags

  site_config {
    always_on         = var.always_on
    ftps_state        = var.ftps_state
    minimum_tls_version = var.minimum_tls_version
    
    dynamic "application_stack" {
      for_each = var.application_stack != null ? [var.application_stack] : []
      content {
        current_stack  = lookup(application_stack.value, "current_stack", null)
        dotnet_version = lookup(application_stack.value, "dotnet_version", null)
        java_version   = lookup(application_stack.value, "java_version", null)
        node_version   = lookup(application_stack.value, "node_version", null)
        php_version    = lookup(application_stack.value, "php_version", null)
        python         = lookup(application_stack.value, "python", null)
      }
    }
  }
}
