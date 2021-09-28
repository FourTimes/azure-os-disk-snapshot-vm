module "snapshot-vm-one" {
  source                         = "./module"
  # new vm name
  vm_name                        = "pspl-snapshot-vm"
  # Disk resource group name
  azurerm_resource_group         = "P2_STRESS_TEST"
  # Existing VM Disk name
  azurerm_managed_disk_name      = "ps-azvlt001"
  # Subnet name
  subnet_name                    = "default"
  # virtual network name
  subnet_virtual_network_name    = "PSPL_ITDev"
  # networking resource group name
  network_azurerm_resource_group = "PSPL_ITDev"
}

