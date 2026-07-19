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

resource "aws_organizations_policy" "protect_cloudtrail" {
  name        = "ProtectCloudTrail"
  description = "Prevent deletion, modification, or disabling of CloudTrail"

  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/protect-cloudtrail.json")
}

resource "aws_organizations_policy_attachment" "protect_cloudtrail_infrastructure" {
  policy_id = aws_organizations_policy.protect_cloudtrail.id
  target_id = var.infrastructure_ou_id
}