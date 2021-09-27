# create  the snapshot the disk

resource "azurerm_snapshot" "tf" {
  name                = "${data.azurerm_managed_disk.tf.name}_snapshot"
  location            = data.azurerm_resource_group.tf.location
  resource_group_name = data.azurerm_resource_group.tf.name
  create_option       = "Copy"
  source_uri          = data.azurerm_managed_disk.tf.id
}


# convert snapshot into managed disk

resource "azurerm_managed_disk" "source" {
  name                 = "${data.azurerm_managed_disk.tf.name}_${var.vm_name}_disk"
  location             = data.azurerm_resource_group.tf.location
  resource_group_name  = data.azurerm_resource_group.tf.name
  storage_account_type = "Standard_LRS"
  create_option        = "Copy"
  source_resource_id   = azurerm_snapshot.tf.source_uri
}




