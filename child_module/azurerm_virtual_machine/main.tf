resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = lookup(each.value, "nic_name", "${each.value.name}-nic")
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = lookup(each.value, "subnet_id", null) != null ? each.value.subnet_id : data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = lookup(each.value, "pip_name", null) != null && lookup(each.value, "pip_name", "") != "" ? data.azurerm_public_ip.pip[each.key].id : lookup(each.value, "pip_id", null)
    private_ip_address_allocation = lookup(each.value, "private_ip", "Dynamic")
  }
}

resource "azurerm_virtual_machine" "main" {
  for_each              = var.vms
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  vm_size               = each.value.vm_size

  storage_image_reference {
    publisher = lookup(each.value, "publisher", "Canonical")
    offer     = lookup(each.value, "offer", "ubuntu-24_04-lts")
    sku       = lookup(each.value, "sku", "server-gen1")
    version   = lookup(each.value, "version", "latest")
  }
  storage_os_disk {
    name              = lookup(each.value, "os_name", "${each.value.name}-osdisk")
    caching           = lookup(each.value, "caching", "ReadWrite")
    create_option     = lookup(each.value, "create_option", "FromImage")
    managed_disk_type = lookup(each.value, "managed_disk_type", "Standard_LRS")
  }
  os_profile {
    computer_name  = lookup(each.value, "computer_name", each.value.name)
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
