###############################################################
# Terraform Remote Backend
#
# Stores the CloudTrail Terraform state in the centralized
# landing-zone S3 backend.
###############################################################

terraform {
  backend "s3" {
    bucket       = "gewa-enterprise-landing-zone-tfstate-905418310734"
    key          = "enterprise-aws-landing-zone/cloudtrail/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}