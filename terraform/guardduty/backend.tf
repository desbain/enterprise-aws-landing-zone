terraform {
  backend "s3" {
    bucket       = "gewa-enterprise-landing-zone-tfstate-905418310734"
    key          = "guardduty/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}