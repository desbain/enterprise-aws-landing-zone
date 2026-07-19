output "policy_id" {
  description = "CloudTrail SCP ID"
  value       = aws_organizations_policy.protect_cloudtrail.id
}

output "policy_name" {
  description = "CloudTrail SCP Name"
  value       = aws_organizations_policy.protect_cloudtrail.name
}