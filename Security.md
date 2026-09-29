# Security Guidance

These configurations are learning examples, not production-ready baselines.
Review and adapt the network, identity, state, and recovery settings before
deploying workloads that matter.

## Credentials and State

- Authenticate with AWS or Azure's supported CLI, environment, or workload
  identity mechanisms. Do not put cloud credentials, private SSH keys, or
  access tokens in Terraform files or variable files.
- Keep `terraform.tfvars` local. The repository ignores `*.tfvars`; commit only
  sanitized example files.
- Terraform state can contain sensitive values even when Terraform marks an
  output as sensitive. Local state is not encrypted or access-controlled by
  Terraform. For shared or important deployments, configure a remote backend
  with encryption, access controls, and state locking before applying.
- Commit `.terraform.lock.hcl` files so provider versions and checksums remain
  consistent across machines.
- Treat saved plan files as sensitive and do not commit them.

## Network Access

- The Azure NSG permits HTTP from the Internet and restricts SSH to the required
  `admin_ssh_source_cidr` variable. Use your current public IP with a `/32`, or
  avoid public SSH by using a managed access path such as Azure Bastion.
- The AWS security group currently permits SSH from `0.0.0.0/0`. Restrict that
  rule to trusted source IP ranges before deploying, and prefer managed session
  access where possible.
- Expose only ports required by the workload. A public IP and an inbound rule
  are separate controls; review both when changing either configuration.

## Identity and Storage

- The Azure VM uses a system-assigned managed identity with Storage Blob Data
  Reader access. Keep role assignments scoped to the smallest required
  resource, and do not replace managed identity access with embedded keys.
- The Azure blob container is private and blob versioning is enabled. Versioning
  is not a backup by itself; set retention and recovery policies appropriate
  for the data.
- The AWS S3 bucket blocks public access and enables versioning. Review deletion
  protection, encryption, lifecycle, and recovery requirements before using it
  for important data.

## Before Applying

- Run `terraform fmt` and `terraform validate` in the selected directory.
- Review the complete `terraform plan`, especially public endpoints, IAM/RBAC
  changes, and replacement or deletion actions.
- Confirm the selected cloud account, subscription, region, and expected costs.
- Keep Terraform and provider versions current through deliberate, reviewed
  upgrades.
