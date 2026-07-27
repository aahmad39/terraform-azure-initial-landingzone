data "azurerm_subnet" "subnet" {
  for_each             = { for k, v in var.vms : k => v if lookup(v, "subnet_id", null) == null }
  name                 = each.value.subnet_name
  virtual_network_name = lookup(each.value, "vnet_name", lookup(each.value, "Vnet_name", null))
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip" {
  for_each            = { for k, v in var.vms : k => v if lookup(v, "pip_name", null) != null && lookup(v, "pip_name", "") != "" }
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}