resource "aws_ssoadmin_account_assignment" "cloud_admins_desbain" {
  instance_arn       = local.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.administrator.arn

  principal_id   = aws_identitystore_group.cloud_admins.group_id
  principal_type = "GROUP"

  target_id   = local.organization_accounts["Desbain"]
  target_type = "AWS_ACCOUNT"

  depends_on = [
    aws_ssoadmin_managed_policy_attachment.admin
  ]
}

resource "aws_ssoadmin_account_assignment" "developers_shared_services" {
  instance_arn       = local.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn

  principal_id   = aws_identitystore_group.developers.group_id
  principal_type = "GROUP"

  target_id   = local.organization_accounts["Shared-services"]
  target_type = "AWS_ACCOUNT"

  depends_on = [
    aws_ssoadmin_managed_policy_attachment.developer
  ]
}

resource "aws_ssoadmin_account_assignment" "security_cloudtrail" {
  instance_arn       = local.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.security_auditor.arn

  principal_id   = aws_identitystore_group.security_team.group_id
  principal_type = "GROUP"

  target_id   = local.organization_accounts["CloudTrail administrator"]
  target_type = "AWS_ACCOUNT"

  depends_on = [
    aws_ssoadmin_managed_policy_attachment.security_auditor
  ]
}

resource "aws_ssoadmin_account_assignment" "auditors_desbain" {
  instance_arn       = local.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.readonly.arn

  principal_id   = aws_identitystore_group.auditors.group_id
  principal_type = "GROUP"

  target_id   = local.organization_accounts["Desbain"]
  target_type = "AWS_ACCOUNT"

  depends_on = [
    aws_ssoadmin_managed_policy_attachment.readonly
  ]
}