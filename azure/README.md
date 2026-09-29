# Azure Terraform Automation

This folder contains a standalone Azure deployment split by resource type.

## Resources

- Resource group, virtual network, and web/private subnets
- Network security group for HTTP and restricted SSH access
- Ubuntu Linux virtual machine with a system-assigned managed identity
- Storage account and private, versioned blob container
- Storage Blob Data Reader role assignment for the virtual machine

## Deploy

1. Create `terraform.tfvars` with your SSH public key and the CIDR allowed to SSH to the VM:

   ```hcl
   admin_ssh_public_key  = "ssh-ed25519 REPLACE_WITH_YOUR_PUBLIC_KEY"
   admin_ssh_source_cidr = "203.0.113.10/32"
   ```

   Replace both example values. The storage account name must be globally unique.
2. Authenticate with Azure CLI using `az login`.
3. Run Terraform:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

Terraform loads all `.tf` files in this directory as one module. Do not commit
`terraform.tfvars`; it contains environment-specific values.
