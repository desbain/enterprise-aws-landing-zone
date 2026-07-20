resource "aws_kms_key" "backup" {
  description             = "KMS key used to encrypt the enterprise AWS Backup vault"
  deletion_window_in_days = var.kms_deletion_window_days
  enable_key_rotation     = true

  tags = {
    Name = "${local.name_prefix}-backup-key"
  }
}

resource "aws_kms_alias" "backup" {
  name          = "alias/${local.name_prefix}-backup"
  target_key_id = aws_kms_key.backup.key_id
}