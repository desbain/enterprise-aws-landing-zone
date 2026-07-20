output "backup_vault_id" {
  description = "ID of the AWS Backup vault."
  value       = aws_backup_vault.this.id
}

output "backup_vault_arn" {
  description = "ARN of the AWS Backup vault."
  value       = aws_backup_vault.this.arn
}

output "backup_vault_name" {
  description = "Name of the AWS Backup vault."
  value       = aws_backup_vault.this.name
}

output "backup_plan_id" {
  description = "ID of the AWS Backup plan."
  value       = aws_backup_plan.this.id
}

output "backup_plan_arn" {
  description = "ARN of the AWS Backup plan."
  value       = aws_backup_plan.this.arn
}

output "backup_plan_version" {
  description = "Version identifier of the AWS Backup plan."
  value       = aws_backup_plan.this.version
}

output "backup_selection_id" {
  description = "ID of the AWS Backup resource selection."
  value       = aws_backup_selection.tagged_resources.id
}

output "backup_service_role_arn" {
  description = "ARN of the IAM role used by AWS Backup."
  value       = aws_iam_role.backup.arn
}

output "backup_kms_key_arn" {
  description = "ARN of the KMS key used to encrypt backup recovery points."
  value       = aws_kms_key.backup.arn
}

output "backup_kms_alias" {
  description = "Alias of the KMS key used by AWS Backup."
  value       = aws_kms_alias.backup.name
}