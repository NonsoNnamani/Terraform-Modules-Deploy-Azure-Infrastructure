variable "container_registry_name" {
  description = "The name of the Container Registry"
}

variable "location" {
  description = "The location of the resources"
}

variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "container_registry_sku" {
  description = "The SKU for the Container Registry"
}

variable "admin_enabled" {
  description = "Enable admin user for the Container Registry"
  type        = bool
}
