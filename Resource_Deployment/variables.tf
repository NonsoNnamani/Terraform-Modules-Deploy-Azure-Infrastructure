variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "RG1"
}

variable "location" {
  description = "The location of the resources"
  default     = "Central US"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  default     = "VNET1"
}

variable "address_space" {
  description = "The address space for the virtual network"
  default     = "10.0.0.0/16"
}

variable "pesubnet_name" {
  description = "The name of the PE subnet"
  default     = "PESubnet"
}

variable "pesubnet_prefix" {
  description = "The address prefix for the PE subnet"
  default     = "10.0.0.0/24"
}

variable "acasubnet_name" {
  description = "The name of the ACA subnet"
  default     = "ACASubnet"
}

variable "acasubnet_prefix" {
  description = "The address prefix for the ACA subnet"
  default     = "10.0.4.0/23"
}

variable "servicebus_namespace_name" {
  description = "The name of the Service Bus namespace"
  default     = "sb-apl2003-yourinitials"
}

variable "servicebus_sku" {
  description = "The SKU for the Service Bus namespace"
  default     = "Basic"
}

variable "container_registry_name" {
  description = "The name of the Container Registry"
  default     = "acrapl2003yourinitialsdate"
}

variable "container_registry_sku" {
  description = "The SKU for the Container Registry"
  default     = "Premium"
}

variable "admin_enabled" {
  description = "Enable admin user for the Container Registry"
  type        = bool
  default     = true
}
