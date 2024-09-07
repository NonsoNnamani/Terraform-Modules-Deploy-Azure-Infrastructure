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
   git clone https://github.com/NonsoNnamani/Terraform-Modules-Deploy-Azure-Infrastructure.git
   cd Terraform-Modules-Deploy-Azure-Infrastructure
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

## Terraform State Files

Here are some common locations where you can store Terraform state files remotely:

1. **Amazon S3**: Use Amazon S3 buckets to store state files. You can also use DynamoDB for state locking and consistency checking.
2. **Azure Blob Storage**: Store state files in Azure Blob Storage containers. Azure also supports state locking and consistency checking.
3. **Google Cloud Storage**: Use Google Cloud Storage buckets for storing state files. Google Cloud also supports state locking.
4. **HashiCorp Consul**: Store state files in HashiCorp Consul, which also provides state locking and consistency checking.
5. **Terraform Cloud**: Use Terraform Cloud to store state files, which includes built-in state locking and versioning.
6. **Alibaba Cloud OSS**: Store state files in Alibaba Cloud Object Storage Service (OSS) buckets.
7. **Artifactory**: Use JFrog Artifactory to store state files, which supports various backend configurations.

These options provide centralized storage, state locking, and versioning, ensuring that your Terraform state files are secure and accessible to your team.

## Using Azure Blob Storage for storing Terraform state files

To use Azure Blob Storage for storing Terraform state files, you need to configure a storage account and a container in Azure, and then update your Terraform configuration to use this remote backend. Here are the steps:

### Step 1: Create an Azure Storage Account and Container

1. **Create a Storage Account:**

   ```hcl
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
   ```

2. **Create a Storage Container:**

   ```hcl
   resource "azurerm_storage_container" "tfstate" {
     name                  = "tfstate"
     storage_account_name  = azurerm_storage_account.tfstate.name
     container_access_type = "private"
   }
   ```

### Step 2: Update Terraform Configuration to Use Remote Backend

Add the following backend configuration to your `main.tf` file:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name   = "RG1"
    storage_account_name  = "tfstate<suffix>"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
```


## Collaboration on a Terraform Project

When multiple team members work on a Terraform project, they need to ensure that their changes are synchronized and do not conflict with each other. This is where the Terraform state file and remote backends come into play.

### What is a Terraform State File?

The Terraform state file (`terraform.tfstate`) is a JSON file that keeps track of the resources managed by Terraform. It maps the configuration in your `.tf` files to the real-world resources in your cloud provider. This state file is essential for Terraform to know what resources exist, their current state, and how to update or destroy them.

### Why Use a Remote Backend?

By default, Terraform stores the state file locally, which is not ideal for team collaboration. A remote backend, such as Azure Blob Storage, allows the state file to be stored in a centralized location. This ensures that all team members are working with the same state file, preventing conflicts and enabling collaboration.

### Example: Using Azure Blob Storage for Remote State

#### Step 1: Set Up Azure Blob Storage

1. **Create a Storage Account and Container:**

   ```hcl
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
   ```

#### Step 2: Configure Terraform to Use the Remote Backend

Add the following backend configuration to your `main.tf` file:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name   = "RG1"
    storage_account_name  = azurerm_storage_account.tfstate.name
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
```

### How Collaboration Works

1. **Initialization:**
   Each team member runs `terraform init` to initialize the backend configuration. This command sets up the remote backend and ensures that Terraform uses the shared state file in Azure Blob Storage.

2. **Planning Changes:**
   Before making any changes, a team member runs `terraform plan`. This command reads the current state from the remote backend and compares it with the desired state defined in the `.tf` files. It then generates an execution plan showing what changes will be made.

3. **Applying Changes:**
   When a team member runs `terraform apply`, Terraform locks the state file in the remote backend to prevent other team members from making changes simultaneously. This ensures that only one person can modify the state at a time, avoiding conflicts. After the changes are applied, the state file is updated and unlocked.

4. **State Locking:**
   Terraform uses state locking to prevent concurrent modifications. When a `terraform apply` is initiated, Terraform locks the state file. If another team member tries to apply changes while the state is locked, they will receive a message indicating that the state is locked.

### Under the Hood

- **State File Management:**
  The state file is stored in Azure Blob Storage, ensuring that all team members have access to the latest state. Terraform uses this state file to map the configuration to real-world resources.

- **State Locking:**
  When a `terraform apply` is run, Terraform locks the state file to prevent concurrent modifications. This lock is released once the apply operation is complete.

- **Consistency:**
  By using a remote backend, the state file is always up-to-date and consistent across all team members. This prevents issues where different team members have different views of the infrastructure.

### Example Scenario

Imagine a team of six members working on a project to deploy a virtual network and subnets in Azure. Each member can:

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/NonsoNnamani/Terraform-Modules-Deploy-Azure-Infrastructure.git
   cd Terraform-Modules-Deploy-Azure-Infrastructure
   ```

2. **Initialize Terraform:**
   ```sh
   terraform init
   ```

3. **Plan Changes:**
   ```sh
   terraform plan
   ```

4. **Apply Changes:**
   ```sh
   terraform apply
   ```

By following these steps, the team ensures that all changes are synchronized and conflicts are avoided. The remote state file in Azure Blob Storage acts as the single source of truth, enabling efficient collaboration.

### Conclusion

Using a remote backend for the Terraform state file is crucial for team collaboration. It ensures that all team members are working with the same state, prevents conflicts through state locking, and maintains consistency across the infrastructure. This setup allows a team of six members to collaborate effectively on a Terraform project, making infrastructure management seamless and efficient.


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
1. Index - Terraform Recommended Practices - HashiCorp Developer. https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices.
2. Best practices for general style and structure | Terraform - Google Cloud. https://cloud.google.com/docs/terraform/best-practices/general-style-structure.
3. 20 Terraform Best Practices to Improve your TF workflow - Spacelift. https://spacelift.io/blog/terraform-best-practices.
4. Using Terraform Remote State - platform.qa.com. https://platform.qa.com/lab/using-terraform-remote-state/.
5. How to Deploy Kubernetes Resources with Terraform [Tutorial]. https://spacelift.io/blog/terraform-kubernetes-deployment.
6. Terraform for DevOps Engineers: Key Practices. https://industrywired.com/terraform-for-devops-engineers-key-practices/.
7. Code styling - Terraform Best Practices. https://www.terraform-best-practices.com/code-styling.
8. en.wikipedia.org. https://en.wikipedia.org/wiki/Terraform_(software).
9. Managing Terraform State | Google Cloud Skills Boost. https://www.cloudskillsboost.google/course_templates/636/labs/464835.
10. Creating a Terraform Configuration File - docs.oracle.com. https://docs.oracle.com/en-us/iaas/Content/Marketplace/create-terraform-configuration-files.htm.
11. 12-infrastructure-as-code-with-terraform.md - GitHub. https://github.com/getsan4u/twn-devops-bootcamp/blob/master/notes%2F12-infrastructure-as-code-with-terraform.md.
12. What is Terraform State - brendanthompson.com. https://brendanthompson.com/what-is-terraform-state/.
13. Managing Terraform State – Best Practices & Examples - Spacelift. https://spacelift.io/blog/terraform-state.
14. Best practices for managing Terraform State files in AWS CI/CD Pipeline. https://aws.amazon.com/blogs/devops/best-practices-for-managing-terraform-state-files-in-aws-ci-cd-pipeline/.
15. Using Terraform remote state for collaboration - DEV Community. https://dev.to/theodesp/using-terraform-remote-state-for-collaboration-4661.
16. Terraform Workflow: How to Work Individually and in a Team. https://expertbeacon.com/terraform-workflow-how-to-work-individually-and-in-a-team/.
