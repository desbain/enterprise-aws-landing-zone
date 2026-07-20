###############################################################
# Current AWS Account
###############################################################

data "aws_caller_identity" "current" {}

###############################################################
# KMS Key Policy
###############################################################

data "aws_iam_policy_document" "cloudtrail_kms" {

  statement {
    sid    = "EnableRootPermissions"
    effect = "Allow"

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }

    actions = [
      "kms:*"
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowCloudTrailEncryption"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*"
    ]

    resources = ["*"]
  }

}

###############################################################
# KMS Key
###############################################################

resource "aws_kms_key" "cloudtrail" {

  description             = "KMS key for Organization CloudTrail"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  policy = data.aws_iam_policy_document.cloudtrail_kms.json

  tags = local.common_tags
}

###############################################################
# KMS Alias
###############################################################

resource "aws_kms_alias" "cloudtrail" {

  name          = "alias/enterprise-cloudtrail"
  target_key_id = aws_kms_key.cloudtrail.key_id
}