# Azure Windows Virtual Machine Module

This module creates an Azure Windows Virtual Machine with a network interface.

## Usage

```hcl
module "windows_vm" {
  source              = "./modules/virtual-machine-windows"
  name                = "my-windows-vm"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  admin_password      = var.admin_password
  subnet_id           = module.virtual_network.subnet_ids["subnet1"]
  
  tags = {
    environment = "production"
  }
}
```

## Requirements

- Terraform >= 1.0
- azurerm provider ~> 4.0

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the virtual machine | string | n/a | yes |
| resource_group_name | The name of the resource group | string | n/a | yes |
| location | The Azure region where the virtual machine will be created | string | n/a | yes |
| subnet_id | The ID of the subnet to connect the VM to | string | n/a | yes |
| admin_password | The admin password for the virtual machine | string | n/a | yes |
| vm_size | The size of the virtual machine | string | Standard_B2s | no |
| admin_username | The admin username for the virtual machine | string | azureuser | no |
| os_disk_caching | The caching type for the OS disk | string | ReadWrite | no |
| os_disk_storage_account_type | The storage account type for the OS disk | string | Standard_LRS | no |
| os_disk_size_gb | The size of the OS disk in GB | number | null | no |
| source_image_reference | The source image reference | object | Windows Server 2022 | no |
| tags | A mapping of tags to assign to the resource | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the virtual machine |
| name | The name of the virtual machine |
| private_ip_address | The private IP address of the virtual machine |
| network_interface_id | The ID of the network interface |
