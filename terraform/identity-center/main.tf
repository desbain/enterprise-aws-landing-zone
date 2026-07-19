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
  instance_arn     = data.aws_ssoadmin_instances.current.arns[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "readonly" {
  name             = "ReadOnlyAccess"
  description      = "Read-only access"
  instance_arn     = data.aws_ssoadmin_instances.current.arns[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "security_auditor" {
  name             = "SecurityAuditor"
  description      = "Security auditing access"
  instance_arn     = data.aws_ssoadmin_instances.current.arns[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "developer" {
  name             = "DeveloperAccess"
  description      = "Developer access"
  instance_arn     = data.aws_ssoadmin_instances.current.arns[0]
  session_duration = "PT8H"
}