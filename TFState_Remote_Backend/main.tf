provider "azurerm" {
  subscription_id = var.azure_subscription_id
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  
  blob_properties {
    delete_retention_policy {
      days = 1
      permanent_delete_enabled = true
    }
    container_delete_retention_policy {
      days = 1
    }
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false 
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.azurerm_storage_container_name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = var.container_access_type
}

output "tfstate_remote_backend_rg_name" {
  value = azurerm_resource_group.rg.name
}

output "tfstate_remote_backend_storage_account_name" {
  value = azurerm_storage_account.tfstate.name
}

output "tfstate_remote_backend_storage_container_name" {
  value = azurerm_storage_container.tfstate.name
}
