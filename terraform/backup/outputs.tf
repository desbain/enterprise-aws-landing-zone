output "backup_vault_name" {
  value = aws_backup_vault.primary.name
}

output "backup_plan_id" {
  value = aws_backup_plan.daily.id
}

output "kms_key_arn" {
  value = aws_kms_key.backup.arn
}