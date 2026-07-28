resource "azurerm_public_ip" "pip" {
  for_each            = var.pips
  name                = lookup(each.value, "name", lookup(each.value, "pip_name", each.key))
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = lookup(each.value, "allocation_method", "Static")
 
}