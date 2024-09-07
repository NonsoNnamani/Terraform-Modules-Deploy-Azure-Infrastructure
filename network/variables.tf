variable "virtual_network_name" {
  description = "The name of the virtual network"
}

variable "location" {
  description = "The location of the resources"
}

variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "address_space" {
  description = "The address space for the virtual network"
}

variable "pesubnet_name" {
  description = "The name of the PE subnet"
}

variable "pesubnet_prefix" {
  description = "The address prefix for the PE subnet"
}

variable "acasubnet_name" {
  description = "The name of the ACA subnet"
}

variable "acasubnet_prefix" {
  description = "The address prefix for the ACA subnet"
}
