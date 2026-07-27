output "subnets" {
  value       = { for k, v in azurerm_subnet.internal : k => v }
  description = "Map of created subnet resources"
}
