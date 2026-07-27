module "rg" {
  source = "../../child_module/azurerm_resource_group"
  rgs    = var.rg_sandbox
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../child_module/azurerm_virtual_network"
  vnets      = var.vnet_sandbox
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../child_module/azurerm_subnet"
  snets      = var.subnet_sandbox
}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../child_module/azurerm_network_security_group"
  nsgs       = var.nsg_sandbox
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../child_module/azurerm_pip"
  pips       = var.pip_sandbox
}

module "vm" {
  depends_on = [module.subnet, module.pip]
  source     = "../../child_module/azurerm_virtual_machine"
  vms        = var.vm_sandbox
}

module "appgw" {
  depends_on = [module.subnet, module.pip]
  source     = "../../child_module/azurerm_application_gateway"
  appgw_map = {
    for k, v in var.appgw_sandbox : k => merge(v, {
      subnet_id    = module.subnet.subnets[v.subnet_key].id
      public_ip_id = module.pip.public_ips[v.pip_key]
    })
  }
}
