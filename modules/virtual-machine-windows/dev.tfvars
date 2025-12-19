# Development environment variables for virtual-machine-windows module
name                         = "vm-win-dev-example"
resource_group_name          = "rg-dev-example"
location                     = "eastus"
vm_size                      = "Standard_B2s"
admin_username               = "azureuser"
admin_password               = "P@ssw0rd123!"  # Note: Use Azure Key Vault in production
subnet_id                    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-dev-example/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/subnet-default"
os_disk_storage_account_type = "Standard_LRS"

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
