# to create the vm use existing snapshot disk

resource "azurerm_virtual_machine" "tf" {
  name                  = var.vm_name
  location              = data.azurerm_resource_group.tf.location
  resource_group_name   = data.azurerm_resource_group.tf.name
  vm_size               = "Standard_D2_v3"
  zones                 = []
  network_interface_ids = [azurerm_network_interface.tf.id]


  boot_diagnostics {
    enabled     = true
    storage_uri = "https://p2stresstestdiag.blob.core.windows.net/"
  }

  # os_profile {
  #   admin_username = "pspladmin"
  #   computer_name  = "PS-AZVLT001"
  #   admin_password = "Password1234!"
  # }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
  }

  # storage_image_reference {
  #   offer     = "WindowsServer"
  #   publisher = "MicrosoftWindowsServer"
  #   sku       = "2016-Datacenter"
  #   version   = "latest"
  # }

  storage_os_disk {
    caching                   = "ReadWrite"
    create_option             = "Attach"
    name                      = "${data.azurerm_managed_disk.tf.name}_${var.vm_name}_disk"
    os_type                   = "Windows"
    write_accelerator_enabled = false
    managed_disk_id           = azurerm_managed_disk.source.id
    managed_disk_type         = azurerm_managed_disk.source.storage_account_type
  }
}
