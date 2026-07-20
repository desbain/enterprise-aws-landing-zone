resource "aws_backup_plan" "daily" {

  name = "enterprise-daily-backup"

  rule {

    rule_name         = "DailyBackup"
    target_vault_name = aws_backup_vault.primary.name
    schedule          = "cron(0 5 * * ? *)"

    lifecycle {
      delete_after = 35
    }
  }
}

resource "aws_backup_selection" "tagged" {

  iam_role_arn = aws_iam_role.backup.arn
  name         = "production-resources"
  plan_id      = aws_backup_plan.daily.id

  selection_tag {

    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "True"

  }
}