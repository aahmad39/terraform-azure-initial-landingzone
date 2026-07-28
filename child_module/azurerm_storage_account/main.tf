resource "azurerm_storage_account" "adn" {
    for_each = var.str
    name=each.value.st_name
    location =each.value.location
    resource_group_name = each.value.name
    account_tier = each.value.account_tier
    account_replication_type = each.value.accountRepli

  
}