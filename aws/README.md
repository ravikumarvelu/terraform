# AWS Terraform Automation

This folder contains a self-contained Terraform deployment for core AWS services without any external data lookups.

## Included resources

- VPC with public and private subnets
- Internet Gateway and public route table
- Security group for web traffic
- EC2 instance running a simple web server
- S3 bucket with versioning and restricted public access
- IAM role and instance profile for EC2

## Usage

1. Review and update the variables in `terraform.tfvars` or the default values in `variables.tf`.
2. Initialize Terraform:

   ```bash
   cd aws
   terraform init
   ```

3. Preview the infrastructure:

   ```bash
   terraform plan
   ```

4. Apply the infrastructure:

   ```bash
   terraform apply
   ```

## Notes

- The EC2 AMI is selected from Canonical's Ubuntu 22.04 images in the configured region.
- The pipeline config in `.github/workflows/terraform-aws.yml` is designed for GitHub Actions with AWS OIDC.
