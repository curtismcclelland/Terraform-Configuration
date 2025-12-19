# Development environment variables for virtual-machine-linux module
name                             = "vm-linux-dev-example"
resource_group_name              = "rg-dev-example"
location                         = "eastus"
vm_size                          = "Standard_B2s"
admin_username                   = "azureuser"
disable_password_authentication  = true
admin_ssh_key                    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC... (example key)"
subnet_id                        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-dev-example/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/subnet-default"
os_disk_storage_account_type     = "Standard_LRS"

tags = {
  Environment = "Development"
  CostCenter  = "Engineering"
}
