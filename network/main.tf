resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "pesubnet" {
  name                 = var.pesubnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.pesubnet_prefix]
}

resource "azurerm_subnet" "acasubnet" {
  name                 = var.acasubnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.acasubnet_prefix]
}
