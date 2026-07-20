resource "aws_kms_key" "backup" {
  description             = "Enterprise AWS Backup KMS Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_backup_vault" "primary" {
  name        = "enterprise-backup-vault"
  kms_key_arn = aws_kms_key.backup.arn
}