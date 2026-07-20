resource "aws_inspector2_enabler" "this" {

  account_ids = [data.aws_caller_identity.current.account_id]

  resource_types = [
    "EC2",
    "ECR",
    "LAMBDA"
  ]

}
data "aws_caller_identity" "current" {}