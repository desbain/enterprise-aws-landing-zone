resource "aws_backup_vault" "this" {
  name        = var.backup_vault_name
  kms_key_arn = aws_kms_key.backup.arn

  tags = {
    Name = var.backup_vault_name
  }
}

resource "aws_backup_plan" "this" {
  name = var.backup_plan_name

  rule {
    rule_name         = "${local.name_prefix}-daily-backup"
    target_vault_name = aws_backup_vault.this.name
    schedule          = var.backup_schedule

    start_window      = var.backup_start_window
    completion_window = var.backup_completion_window

    lifecycle {
      cold_storage_after = var.cold_storage_after_days
      delete_after       = var.delete_after_days
    }

    recovery_point_tags = merge(
      local.common_tags,
      {
        BackupPlan = var.backup_plan_name
      }
    )
  }

  tags = {
    Name = var.backup_plan_name
  }
}

resource "aws_backup_selection" "tagged_resources" {
  name         = var.backup_selection_name
  plan_id      = aws_backup_plan.this.id
  iam_role_arn = aws_iam_role.backup.arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = var.backup_tag_key
    value = var.backup_tag_value
  }

  depends_on = [
    aws_iam_role_policy_attachment.backup,
    aws_iam_role_policy_attachment.restore,
    aws_iam_role_policy.backup_kms
  ]
}