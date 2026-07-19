output "identity_center_arn" {
  value = data.aws_ssoadmin_instances.current.arns
}

output "identity_store_id" {
  value = data.aws_ssoadmin_instances.current.identity_store_ids
}



output "permission_set_arns" {
  description = "IAM Identity Center permission-set ARNs"

  value = {
    administrator    = aws_ssoadmin_permission_set.administrator.arn
    developer        = aws_ssoadmin_permission_set.developer.arn
    readonly         = aws_ssoadmin_permission_set.readonly.arn
    security_auditor = aws_ssoadmin_permission_set.security_auditor.arn
  }
}
output "organization_accounts" {
  description = "Active AWS Organization account names and IDs"
  value       = local.organization_accounts
}