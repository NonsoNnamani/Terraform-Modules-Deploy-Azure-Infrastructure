provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./network"
  virtual_network_name = var.virtual_network_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
  pesubnet_name       = var.pesubnet_name
  pesubnet_prefix     = var.pesubnet_prefix
  acasubnet_name      = var.acasubnet_name
  acasubnet_prefix    = var.acasubnet_prefix
}

module "servicebus" {
  source                  = "./servicebus"
  servicebus_namespace_name = var.servicebus_namespace_name
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg.name
  servicebus_sku          = var.servicebus_sku
}

module "container_registry" {
  source                  = "./container_registry"
  container_registry_name = var.container_registry_name
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg.name
  container_registry_sku  = var.container_registry_sku
  admin_enabled           = var.admin_enabled
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

terraform {
  backend "azurerm" {
    resource_group_name   = "RG1"
    storage_account_name  = azurerm_storage_account.tfstate.name
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
