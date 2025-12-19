# Production environment variables for virtual-machine-linux module
name                             = "vm-linux-prod-example"
resource_group_name              = "rg-prod-example"
location                         = "eastus"
vm_size                          = "Standard_D4s_v3"
admin_username                   = "azureuser"
disable_password_authentication  = true
admin_ssh_key                    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC... (example key)"
subnet_id                        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-prod-example/providers/Microsoft.Network/virtualNetworks/vnet-prod/subnets/subnet-default"
os_disk_storage_account_type     = "Premium_LRS"

tags = {
  Environment = "Production"
  CostCenter  = "Engineering"
}
