# data "azurerm_subnet" "subnet" {
#   for_each = var.vm-dev
#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.vnet_net
#   resource_group_name  = each.value.rg_name
# }

# data "azurerm_public_ip" "pip" {
#   for_each = var.nics
#   name                = each.value.pip_name
#   resource_group_name = each.value.rg_name
# }

# resource "azurerm_network_interface" "nic" {
#   for_each            = var.nics
#   name                = each.value.nic_name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = data.azurerm_subnet.subnet[each.key].id
#     public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
#     private_ip_address_allocation = each.value.private_ip
#   }
# }

