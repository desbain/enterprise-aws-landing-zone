# AWS Backup Terraform Module

This Terraform module establishes centralized backup resources for the
Enterprise AWS Landing Zone.

## Resources Created

- AWS Backup vault
- AWS Backup plan
- Tag-based backup resource selection
- Customer-managed AWS KMS key
- AWS KMS alias
- AWS Backup IAM service role
- AWS managed backup and restore policy attachments
- IAM policy allowing the backup role to use the KMS key

## Backup Schedule

The default backup plan runs daily at 05:00 UTC.

Recovery points are:

- Transitioned to cold storage after 30 days
- Deleted after 365 days

These values can be changed using Terraform variables.

## Resource Selection

Resources are included when they have this tag:

```text
Backup = true