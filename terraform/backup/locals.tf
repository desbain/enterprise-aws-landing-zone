locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Repository  = "enterprise-aws-landing-zone"
      Module      = "AWS-Backup"
    },
    var.additional_tags
  )
}