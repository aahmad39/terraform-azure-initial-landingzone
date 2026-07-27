output "resource_group_name" {
  value       = [for rg in module.rg.rgs : rg.name]
  description = "Name of the created Resource Group"
}

output "virtual_network_name" {
  value       = [for vnet in module.vnet.vnets : vnet.name]
  description = "Name of the Virtual Network"
}

output "subnet_ids" {
  value       = { for k, v in module.subnet.subnets : k => v.id }
  description = "IDs of the Frontend, Backend, and Database subnets"
}

output "public_ip_addresses" {
  value       = module.pip.public_ips
  description = "Public IP resource IDs created for Gateway and Frontend VM"
}
