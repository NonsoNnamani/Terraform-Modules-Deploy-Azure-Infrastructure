resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.container_registry_sku
  admin_enabled       = var.admin_enabled
}
