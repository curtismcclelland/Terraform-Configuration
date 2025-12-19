# Staging environment variables for virtual-machine-linux module
name                             = "vm-linux-stage-example"
resource_group_name              = "rg-stage-example"
location                         = "eastus"
vm_size                          = "Standard_D2s_v3"
admin_username                   = "azureuser"
disable_password_authentication  = true
admin_ssh_key                    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC... (example key)"
subnet_id                        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-stage-example/providers/Microsoft.Network/virtualNetworks/vnet-stage/subnets/subnet-default"
os_disk_storage_account_type     = "Premium_LRS"

tags = {
  Environment = "Staging"
  CostCenter  = "Engineering"
}
