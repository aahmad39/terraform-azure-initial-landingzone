resource "azurerm_application_gateway" "appgw" {
  for_each            = var.appgw_map
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  sku {
    name     = lookup(each.value.sku, "name", "Standard_v2")
    tier     = lookup(each.value.sku, "tier", "Standard_v2")
    capacity = lookup(each.value.sku, "capacity", 2)
  }

  gateway_ip_configuration {
    name      = "${each.value.name}-gw-ip-config"
    subnet_id = each.value.subnet_id
  }

  frontend_port {
    name = "${each.value.name}-fe-port"
    port = lookup(each.value, "frontend_port", 80)
  }

  frontend_ip_configuration {
    name                 = "${each.value.name}-fe-ip-config"
    public_ip_address_id = each.value.public_ip_id
  }

  backend_address_pool {
    name         = "${each.value.name}-be-pool"
    ip_addresses = lookup(each.value, "backend_ip_addresses", null)
  }

  backend_http_settings {
    name                  = "${each.value.name}-be-http-settings"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = lookup(each.value, "backend_port", 80)
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "${each.value.name}-listener"
    frontend_ip_configuration_name = "${each.value.name}-fe-ip-config"
    frontend_port_name             = "${each.value.name}-fe-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${each.value.name}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${each.value.name}-listener"
    backend_address_pool_name  = "${each.value.name}-be-pool"
    backend_http_settings_name = "${each.value.name}-be-http-settings"
    priority                   = 100
  }
}
