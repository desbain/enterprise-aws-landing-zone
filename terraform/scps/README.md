# AWS Organizations SCP Module

This Terraform module manages AWS Organizations Service Control Policies for the Enterprise AWS Landing Zone.

## Current Policy

- ProtectCloudTrail
- Attached to the Infrastructure OU
- Prevents deletion, modification, and disabling of CloudTrail

## Remote State

Terraform state is stored in:

`enterprise-aws-landing-zone/scps/terraform.tfstate`

The backend uses:

- S3 encryption
- S3 versioning
- S3 native state locking

## Commands

```bash
terraform init
terraform validate
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"