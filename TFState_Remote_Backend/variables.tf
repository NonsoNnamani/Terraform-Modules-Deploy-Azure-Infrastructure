variable "azure_subscription_id" {
  description = "Your Azure subscription ID gotten by running the PowerShell script"
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "BackendRG"
}

variable "location" {
  description = "location where storage account will be created"
  default = "centralus"
}

variable "account_tier" {
  description = "the storage account tier"
  default = "Standard"
}

variable "account_replication_type" {
  description = "replication type for the storage account"
  default = "LRS"
}

variable "azurerm_storage_container_name" {
  description = "name of the container in the azure storage account"
  default = "tfstate"
}

variable "container_access_type" {
  description = "access type for the storage container"
  default = "private"
}
