data "azurerm_resource_group" "tf" {
  name = "P2_STRESS_TEST"                                                         # Disk resource group name
}

data "azurerm_managed_disk" "tf" {
  name                = "PS-AZVLT001_OsDisk_1_639d5e751d174af5b06f336f63aa0ac3"   # Disk name
  resource_group_name = data.azurerm_resource_group.tf.name
}


data "azurerm_subnet" "tf" {
  name                 = "default"             # subnet name
  virtual_network_name = "PSPL_ITDev"          # vnet name
  resource_group_name  = "PSPL_ITDEV"          # vnet resource group name
}

variable "vm_name" {
  default = "PS-AZVLT001-TEST"                 # new vm name
}
