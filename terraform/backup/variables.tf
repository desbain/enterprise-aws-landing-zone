variable "aws_region" {
  description = "AWS Region where the backup resources will be deployed."
  type        = string
  default     = "us-east-2"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Name of the project used when naming resources."
  type        = string
  default     = "enterprise-landing-zone"
}

variable "backup_vault_name" {
  description = "Name of the AWS Backup vault."
  type        = string
  default     = "enterprise-backup-vault"
}

variable "backup_plan_name" {
  description = "Name of the AWS Backup plan."
  type        = string
  default     = "enterprise-daily-backup-plan"
}

variable "backup_selection_name" {
  description = "Name of the resource selection associated with the backup plan."
  type        = string
  default     = "enterprise-tagged-resources"
}

variable "backup_schedule" {
  description = "AWS Backup cron schedule. The default runs daily at 5:00 AM UTC."
  type        = string
  default     = "cron(0 5 ? * * *)"
}

variable "backup_start_window" {
  description = "Number of minutes after the scheduled time in which a backup job must start."
  type        = number
  default     = 60

  validation {
    condition     = var.backup_start_window >= 60
    error_message = "The backup start window must be at least 60 minutes."
  }
}

variable "backup_completion_window" {
  description = "Number of minutes in which the backup job should complete."
  type        = number
  default     = 180
}

variable "cold_storage_after_days" {
  description = "Number of days before eligible recovery points transition to cold storage."
  type        = number
  default     = 30
}

variable "delete_after_days" {
  description = "Number of days before recovery points are deleted."
  type        = number
  default     = 365

  validation {
    condition = (
      var.delete_after_days >
      var.cold_storage_after_days
    )

    error_message = "delete_after_days must be greater than cold_storage_after_days."
  }
}

variable "backup_tag_key" {
  description = "Tag key used to select resources for backup."
  type        = string
  default     = "Backup"
}

variable "backup_tag_value" {
  description = "Tag value used to select resources for backup."
  type        = string
  default     = "true"
}

variable "kms_deletion_window_days" {
  description = "Waiting period before the KMS key can be permanently deleted."
  type        = number
  default     = 30

  validation {
    condition = (
      var.kms_deletion_window_days >= 7 &&
      var.kms_deletion_window_days <= 30
    )

    error_message = "The KMS deletion window must be between 7 and 30 days."
  }
}

variable "additional_tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}