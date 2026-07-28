rg-dev = {
  rg1 = {
    name     = "rg-002"
    st_name="stg000966"
    location = "central india"
    account_tier="Standard"
    accountRepli="GRS"
  }
    rg2 = {
    name     = "rg-003"
    st_name="stg000966"
    location = "central india"
    account_tier="Standard"
    accountRepli="GRS"
  }

}

vnet-dev = {
  vnet1 = {
    name          = "vnet-001"
    location      = "central india"
    rg_name       = "rg-002"
    address_space = ["10.0.0.0/16"]
  }
}

subnet-dev = {
  subnet1 = {
    name        = "snet-frontend-001"
    rg_name     = "rg-002"
    vnet_name   = "vnet-001"
    address_pre = ["10.0.1.0/24"]
  }

  subnet2 = {
    name        = "snet-backend-001"
    rg_name     = "rg-002"
    vnet_name   = "vnet-001"
    address_pre = ["10.0.2.0/24"]
  }
}

nic-dev = {
  nic1 = {
    subnet_name = "snet-frontend-001"
    vnet_net    = "vnet-001"
    rg_name     = "rg-002"
    location    = "central india"
    private_ip  = "Dynamic"
    pip_name    = "pip-frontend-001"
    nic_name    = "nic-frontend-001"

  }

  nic2 = {
    subnet_name = "snet-backend-001"
    vnet_net    = "vnet-001"
    rg_name     = "rg-002"
    location    = "central india"
    private_ip  = "Dynamic"
    pip_name    = "pip-backend-001"
    nic_name    = "nic-backend-001"

  }
}

vm-dev = {
  vm1 = {
    subnet_name       = "snet-frontend-001"
    name              = "frontend-vm-001"
    location          = "central india"
    rg_name           = "rg-002"
    Vnet_name         = "vnet-001"
    address_space     = ["10.0.0.0/16"]
    pip_name          = "pip-frontend-001"
    nic_name          = "nic-frontend-001"
    private_ip        = "Dynamic"
    vm_size           = "Standard_D2s_v3"
    publisher         = "Canonical"
    offer             = "ubuntu-24_04-lts"
    sku               = "server-gen1"
    version           = "latest"
    os_name           = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    computer_name     = "frontend-vm"
    admin_username    = "aahmad"
    admin_password    = "Connect@2026"
    allocation_method = "Static"
    github_token      = "ghp_123456789012345678901234567890123456"
    key_vault_name    = "dev-key-vault1"
  }
  vm2 = {
    subnet_name       = "snet-backend-001"
    name              = "backend-vm-001"
    location          = "central india"
    rg_name           = "rg-002"
    Vnet_name         = "vnet-001"
    address_space     = ["10.0.0.0/16"]
    private_ip        = "Dynamic"
    pip_name          = "pip-backend-001"
    nic_name          = "nic-backend-001"
    vm_size           = "Standard_D2s_v3"
    publisher         = "Canonical"
    offer             = "ubuntu-24_04-lts"
    sku               = "server-gen1"
    version           = "latest"
    os_name           = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    computer_name     = "backend-vm"
    admin_username    = "aahmad"
    admin_password    = "Connect@2026"
    allocation_method = "Static"
    key_vault_name    = "dev-key-vault2"
  }
}
