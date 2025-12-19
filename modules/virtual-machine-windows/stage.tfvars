# Staging environment variables for virtual-machine-windows module
name                         = "vm-win-stage-example"
resource_group_name          = "rg-stage-example"
location                     = "eastus"
vm_size                      = "Standard_D2s_v3"
admin_username               = "azureuser"
admin_password               = "P@ssw0rd123!"  # Note: Use Azure Key Vault in production
subnet_id                    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-stage-example/providers/Microsoft.Network/virtualNetworks/vnet-stage/subnets/subnet-default"
os_disk_storage_account_type = "Premium_LRS"

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
