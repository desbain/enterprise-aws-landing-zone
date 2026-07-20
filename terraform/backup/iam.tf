data "aws_iam_policy_document" "backup_assume_role" {
  statement {
    sid     = "AllowAWSBackupToAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "backup" {
  name               = "${local.name_prefix}-backup-service-role"
  assume_role_policy = data.aws_iam_policy_document.backup_assume_role.json

  tags = {
    Name = "${local.name_prefix}-backup-service-role"
  }
}

resource "aws_iam_role_policy_attachment" "backup" {
  role       = aws_iam_role.backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_iam_role_policy_attachment" "restore" {
  role       = aws_iam_role.backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
}

data "aws_iam_policy_document" "backup_kms" {
  statement {
    sid    = "AllowBackupKMSUsage"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyWithoutPlaintext",
      "kms:ReEncryptFrom",
      "kms:ReEncryptTo",
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]

    resources = [
      aws_kms_key.backup.arn
    ]
  }
}

resource "aws_iam_role_policy" "backup_kms" {
  name   = "${local.name_prefix}-backup-kms-policy"
  role   = aws_iam_role.backup.id
  policy = data.aws_iam_policy_document.backup_kms.json
}