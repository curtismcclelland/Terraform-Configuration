variable "name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual machine will be created"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "The ID of the subnet to connect the VM to"
  type        = string
}

variable "os_disk_caching" {
  description = "The caching type for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB"
  type        = number
  default     = null
}

variable "source_image_reference" {
  description = "The source image reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
