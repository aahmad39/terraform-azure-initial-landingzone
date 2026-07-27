module "rg-dev" {
  source = "../../child_module/arurerm_resource_group"
  rgs    = var.rg-dev

}

module "vnet-dev" {
  depends_on = [module.rg-dev]
  source     = "../../child_module/azurerm_virtual_network"
  vnets      = var.vnet-dev
}

module "subnet-dev" {
  depends_on = [module.vnet-dev]
  source     = "../../child_module/azurerm_subnet"
  snets      = var.subnet-dev
}

module "pip" {
  depends_on = [module.rg-dev]
  source     = "../../child_module/azurerm_pip"
  pips       = var.vm-dev
}

module "vm-dev" {
  depends_on = [module.subnet-dev, module.pip]
  source     = "../../child_module/azurerm_virtual_machine"
  vms        = var.vm-dev
}
