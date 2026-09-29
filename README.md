# Terraform Cloud Examples

This repository contains two independent Terraform configurations. Choose the
cloud directory you want to deploy; each directory is a separate Terraform root
module with its own state.

| Directory          | Example infrastructure                                                                            |
| ------------------ | ------------------------------------------------------------------------------------------------- |
| [`aws/`](aws/)     | VPC and subnets, EC2 web server, security group, S3 bucket, and EC2 IAM role                      |
| [`azure/`](azure/) | Resource group, virtual network and subnets, Ubuntu web VM, storage account, and managed identity |

## Prerequisites

- Terraform 1.5 or newer
- Credentials for the cloud provider you plan to use
- Review of the provider-specific variables and security settings

## Deploy

For AWS, configure credentials with your normal AWS CLI profile or environment,
then run:

```bash
terraform -chdir=aws init
terraform -chdir=aws plan
terraform -chdir=aws apply
```

For Azure, sign in with Azure CLI, select the intended subscription, and set the
subscription ID for AzureRM provider v4:

```bash
az login
az account set --subscription "YOUR_SUBSCRIPTION_ID"
$env:ARM_SUBSCRIPTION_ID = (az account show --query id --output tsv)
```

Create `azure/terraform.tfvars` with the required `admin_ssh_public_key` and
`admin_ssh_source_cidr` values as described in [`azure/README.md`](azure/README.md),
then run:

```bash
terraform -chdir=azure init
terraform -chdir=azure plan
terraform -chdir=azure apply
```

Review the plan before applying. To remove a deployment, run
`terraform -chdir=<aws-or-azure> destroy` for the same directory and state.

## Repository Notes

- Terraform automatically loads all `.tf` files in a directory as one module;
  the resource files are organized by concern, not as separate modules.
- Provider lock files are kept per configuration and should be committed.
- State files, local `.tfvars` files, plans, and the `.terraform` directory are
  excluded from version control. See [Security.md](Security.md) before using
  these examples beyond a sandbox.
