# Terraform-Modules-Deploy-Azure-Infrastructure
This repository contains Terraform scripts for deploying Azure infrastructure using modular configurations. It includes the creation of a Resource Group, Virtual Network with subnets, Service Bus namespace, and Azure Container Registry. Each resource is managed through dedicated modules, promoting code reusability and organization.



---

# Terraform Azure Infrastructure Deployment

## Overview

This Terraform project is designed to deploy a set of Azure resources, including a Resource Group, Virtual Network with subnets, Service Bus namespace, and Azure Container Registry. The project is modular, allowing for easy customization and reuse of the code.

## Project Structure

The project is organized into the following directories and files:

```
.
├── main.tf
├── variables.tf
├── network
│   ├── main.tf
│   └── variables.tf
├── servicebus
│   ├── main.tf
│   └── variables.tf
└── container_registry
    ├── main.tf
    └── variables.tf
```

### `main.tf`

This file contains the root configuration, which includes the provider configuration and the resource group definition. It also calls the modules for the network, service bus, and container registry.

### `variables.tf`

This file defines all the variables used in the root configuration. It allows for easy customization of the resource names, locations, and other parameters.

### `network/main.tf`

This module defines the Virtual Network and its subnets. It uses variables to configure the network name, address space, and subnet prefixes.

### `network/variables.tf`

This file defines the variables used in the network module.

### `servicebus/main.tf`

This module defines the Service Bus namespace. It uses variables to configure the namespace name, location, and SKU.

### `servicebus/variables.tf`

This file defines the variables used in the service bus module.

### `container_registry/main.tf`

This module defines the Azure Container Registry. It uses variables to configure the registry name, location, SKU, and admin user settings.

### `container_registry/variables.tf`

This file defines the variables used in the container registry module.

## How to Use

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An Azure subscription.

### Steps

1. **Clone the repository:**

   ```sh
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform:**

   ```sh
   terraform init
   ```

3. **Review the execution plan:**

   ```sh
   terraform plan
   ```

4. **Apply the configuration:**

   ```sh
   terraform apply
   ```

   Confirm the apply step by typing `yes` when prompted.

## Customization

You can customize the deployment by modifying the variables in the `variables.tf` files. Here are some of the key variables you can change:

- `resource_group_name`: The name of the resource group.
- `location`: The location of the resources.
- `virtual_network_name`: The name of the virtual network.
- `address_space`: The address space for the virtual network.
- `pesubnet_name`: The name of the PE subnet.
- `pesubnet_prefix`: The address prefix for the PE subnet.
- `acasubnet_name`: The name of the ACA subnet.
- `acasubnet_prefix`: The address prefix for the ACA subnet.
- `servicebus_namespace_name`: The name of the Service Bus namespace.
- `servicebus_sku`: The SKU for the Service Bus namespace.
- `container_registry_name`: The name of the Container Registry.
- `container_registry_sku`: The SKU for the Container Registry.
- `admin_enabled`: Enable admin user for the Container Registry.

## Improving the Project

Here are some suggestions for improving the project:

1. **Add more modules:** You can add more modules to manage other Azure resources like Azure SQL Database, Azure Functions, etc.
2. **Use remote state:** Store the Terraform state file in a remote backend like Azure Storage to enable collaboration and state management.
3. **Implement CI/CD:** Integrate Terraform with a CI/CD pipeline to automate the deployment process.
4. **Add output variables:** Define output variables to expose important information like resource IDs, IP addresses, etc.
5. **Use data sources:** Use Terraform data sources to query existing resources and use their attributes in your configuration.

## References

- [Terraform Documentation](https://www.terraform.io/docs)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

---

Feel free to reach out if you have any questions or need further assistance! 😊

Source: Conversation with Copilot, 07/09/2024
(1) Index - Terraform Recommended Practices - HashiCorp Developer. https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices.
(2) Best practices for general style and structure | Terraform - Google Cloud. https://cloud.google.com/docs/terraform/best-practices/general-style-structure.
(3) 20 Terraform Best Practices to Improve your TF workflow - Spacelift. https://spacelift.io/blog/terraform-best-practices.
(4) Code styling - Terraform Best Practices. https://www.terraform-best-practices.com/code-styling.
(5) en.wikipedia.org. https://en.wikipedia.org/wiki/Terraform_(software).
