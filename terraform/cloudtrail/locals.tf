###############################################################
# Local Values
###############################################################

locals {

  project = "enterprise-aws-landing-zone"

  common_tags = {
    Project     = local.project
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Cloud Security"
  }

}