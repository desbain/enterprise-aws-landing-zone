output "protect_cloudtrail_policy_id" {
  description = "ID of the Protect CloudTrail SCP."
  value       = aws_organizations_policy.protect_cloudtrail.id
}

output "protect_cloudtrail_policy_name" {
  description = "Name of the Protect CloudTrail SCP."
  value       = aws_organizations_policy.protect_cloudtrail.name
}

output "deny_leaving_org_policy_id" {
  description = "ID of the Deny Leaving Organization SCP."
  value       = aws_organizations_policy.deny_leaving_org.id
}

output "deny_leaving_org_policy_name" {
  description = "Name of the Deny Leaving Organization SCP."
  value       = aws_organizations_policy.deny_leaving_org.name
}

output "restrict_regions_policy_id" {
  description = "ID of the Restrict Approved Regions SCP."
  value       = aws_organizations_policy.restrict_regions.id
}

output "restrict_regions_policy_name" {
  description = "Name of the Restrict Approved Regions SCP."
  value       = aws_organizations_policy.restrict_regions.name
}

output "protect_config_policy_id" {
  description = "ID of the Protect AWS Config SCP."
  value       = aws_organizations_policy.protect_config.id
}

output "protect_config_policy_name" {
  description = "Name of the Protect AWS Config SCP."
  value       = aws_organizations_policy.protect_config.name
}

output "protect_guardduty_policy_id" {
  description = "ID of the Protect Amazon GuardDuty SCP."
  value       = aws_organizations_policy.protect_guardduty.id
}

output "protect_guardduty_policy_name" {
  description = "Name of the Protect Amazon GuardDuty SCP."
  value       = aws_organizations_policy.protect_guardduty.name
}

output "protect_securityhub_policy_id" {
  description = "ID of the Protect Security Hub SCP."
  value       = aws_organizations_policy.protect_securityhub.id
}

output "protect_securityhub_policy_name" {
  description = "Name of the Protect Security Hub SCP."
  value       = aws_organizations_policy.protect_securityhub.name
}