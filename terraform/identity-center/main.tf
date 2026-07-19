terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ssoadmin_instances" "current" {}

resource "aws_ssoadmin_permission_set" "administrator" {
  name             = "AdministratorAccess"
  description      = "Full administrative access"
  instance_arn     = local.identity_center_instance_arn
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "readonly" {
  name             = "ReadOnlyAccess"
  description      = "Read-only access"
  instance_arn     = local.identity_center_instance_arn
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "security_auditor" {
  name             = "SecurityAuditor"
  description      = "Security auditing access"
  instance_arn     = local.identity_center_instance_arn
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "developer" {
  name             = "DeveloperAccess"
  description      = "Developer access"
  instance_arn     = local.identity_center_instance_arn
  session_duration = "PT8H"
}

# Add Organizations discovery
data "aws_organizations_organization" "current" {}

# Local values
locals {
  identity_center_instance_arn = data.aws_ssoadmin_instances.current.arns[0]
  identity_store_id            = data.aws_ssoadmin_instances.current.identity_store_ids[0]

  organization_accounts = {
    for account in data.aws_organizations_organization.current.accounts :
    account.name => account.id
    if account.state == "ACTIVE"
  }
}