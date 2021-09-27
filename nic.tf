

resource "azurerm_network_interface" "tf" {
  name                = "${var.vm_name}-inc"
  location            = data.azurerm_resource_group.tf.location
  resource_group_name = data.azurerm_resource_group.tf.name

  ip_configuration {
    name                          = lower(var.vm_name)
    subnet_id                     = data.azurerm_subnet.tf.id
    private_ip_address_allocation = "Dynamic"
  }
}
