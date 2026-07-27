resource "azurerm_key_vault" "example" {
  for_each            = var.key-vault
  name                = each.value.key_vault_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

