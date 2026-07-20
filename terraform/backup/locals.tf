locals {

  common_tags = {
    Project     = "enterprise-aws-landing-zone"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Cloud Security"
  }

}
