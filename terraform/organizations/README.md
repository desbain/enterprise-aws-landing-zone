# AWS Organizations Module

This Terraform module reads and, in later phases, will manage the AWS Organization for the Enterprise AWS Landing Zone.

## Current Capabilities

- Read AWS Organization
- Output Organization information
- Prepare for OU management
- Prepare for AWS Account management

## Backend

- Remote S3 backend
- Versioning enabled
- S3 native locking

## Commands

```bash
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```