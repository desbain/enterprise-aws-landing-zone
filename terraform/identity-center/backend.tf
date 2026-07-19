terraform {
  backend "s3" {
    bucket       = "gewa-enterprise-landing-zone-tfstate-905418310734"
    key          = "enterprise-aws-landing-zone/identity-center/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}