variable "location" {
  description = "Azure region for deployment."
  type        = string
  default     = "East US"
}

variable "project_name" {
  description = "Project name used for naming resources."
  type        = string
  default     = "terraform-azure-demo"
}

variable "environment" {
  description = "Environment name such as dev, qa, or prod."
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
  default     = "terraform-azure-demo-rg"
}

variable "vnet_cidr" {
  description = "CIDR block for the virtual network."
  type        = string
  default     = "10.10.0.0/16"
}

variable "web_subnet_cidr" {
  description = "CIDR block for the web virtual machine subnet."
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.10.2.0/24"
}

variable "admin_username" {
  description = "Administrator username for the Linux virtual machine."
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  description = "SSH public key used to access the Linux virtual machine."
  type        = string
  sensitive   = true
}

variable "admin_ssh_source_cidr" {
  description = "CIDR allowed to connect to the VM over SSH, such as your public IP with /32."
  type        = string
}

variable "vm_size" {
  description = "Azure virtual machine size."
  type        = string
  default     = "Standard_B1s"
}

variable "storage_account_name" {
  description = "Globally unique lowercase name for the Azure storage account (3-24 letters and numbers)."
  type        = string
  default     = "tfazuredemoassets01"
}
