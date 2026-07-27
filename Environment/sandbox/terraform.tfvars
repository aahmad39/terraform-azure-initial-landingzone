# 1. Resource Group Configuration
rg_sandbox = {
  rg1 = {
    name     = "rg-sandbox-001"
    location = "central india"
  }
}

# 2. Virtual Network Configuration
vnet_sandbox = {
  vnet1 = {
    name          = "vnet-sandbox-001"
    location      = "central india"
    rg_name       = "rg-sandbox-001"
    address_space = ["10.10.0.0/16"]
  }
}

# 3. Subnets Configuration (Dedicated AppGw Subnet + Frontend, Backend, Database)
subnet_sandbox = {
  appgw_snet = {
    name        = "snet-appgw-001"
    rg_name     = "rg-sandbox-001"
    vnet_name   = "vnet-sandbox-001"
    address_pre = ["10.10.0.0/24"]
  }
  frontend_snet = {
    name        = "snet-frontend-001"
    rg_name     = "rg-sandbox-001"
    vnet_name   = "vnet-sandbox-001"
    address_pre = ["10.10.1.0/24"]
  }
  backend_snet = {
    name        = "snet-backend-001"
    rg_name     = "rg-sandbox-001"
    vnet_name   = "vnet-sandbox-001"
    address_pre = ["10.10.2.0/24"]
  }
  database_snet = {
    name        = "snet-database-001"
    rg_name     = "rg-sandbox-001"
    vnet_name   = "vnet-sandbox-001"
    address_pre = ["10.10.3.0/24"]
  }
}

# 4. Public IP Configuration (Dedicated PIP for Application Gateway)
pip_sandbox = {
  appgw_pip = {
    name              = "pip-appgw-001"
    location          = "central india"
    rg_name           = "rg-sandbox-001"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

# 5. Network Security Group Configuration
nsg_sandbox = {
  nsg1 = {
    name     = "nsg-sandbox-001"
    location = "central india"
    rg_name  = "rg-sandbox-001"
    security_rules = [
      {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-HTTPS"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-SSH"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

# 6. Virtual Machines Configuration (3 VMs: Standard_D2s_v3 for reliable CentralIndia quota)
vm_sandbox = {
  vm1_frontend = {
    name              = "vm-frontend-001"
    location          = "central india"
    rg_name           = "rg-sandbox-001"
    vnet_name         = "vnet-sandbox-001"
    subnet_name       = "snet-frontend-001"
    nic_name          = "nic-frontend-001"
    vm_size           = "Standard_D2s_v3"
    publisher         = "Canonical"
    offer             = "ubuntu-24_04-lts"
    sku               = "server-gen1"
    version           = "latest"
    computer_name     = "vm-frontend"
    admin_username    = "azureadmin"
    admin_password    = "SandboxAdmin@2026"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  vm2_backend = {
    name              = "vm-backend-001"
    location          = "central india"
    rg_name           = "rg-sandbox-001"
    vnet_name         = "vnet-sandbox-001"
    subnet_name       = "snet-backend-001"
    nic_name          = "nic-backend-001"
    vm_size           = "Standard_D2s_v3"
    publisher         = "Canonical"
    offer             = "ubuntu-24_04-lts"
    sku               = "server-gen1"
    version           = "latest"
    computer_name     = "vm-backend"
    admin_username    = "azureadmin"
    admin_password    = "SandboxAdmin@2026"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  vm3_database = {
    name              = "vm-database-001"
    location          = "central india"
    rg_name           = "rg-sandbox-001"
    vnet_name         = "vnet-sandbox-001"
    subnet_name       = "snet-database-001"
    nic_name          = "nic-database-001"
    vm_size           = "Standard_D2s_v3"
    publisher         = "Canonical"
    offer             = "ubuntu-24_04-lts"
    sku               = "server-gen1"
    version           = "latest"
    computer_name     = "vm-database"
    admin_username    = "azureadmin"
    admin_password    = "SandboxAdmin@2026"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}

# 7. Application Gateway Configuration
appgw_sandbox = {
  appgw1 = {
    name          = "appgw-sandbox-001"
    location      = "central india"
    rg_name       = "rg-sandbox-001"
    subnet_key    = "appgw_snet"
    pip_key       = "appgw_pip"
    frontend_port = 80
    backend_port  = 80
    sku = {
      name     = "Standard_v2"
      tier     = "Standard_v2"
      capacity = 2
    }
  }
}
