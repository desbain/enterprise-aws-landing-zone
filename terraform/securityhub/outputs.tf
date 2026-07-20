output "securityhub_account_id" {
  value = aws_securityhub_account.this.id
}

output "aws_foundational_standard" {
  value = aws_securityhub_standards_subscription.aws_foundational.id
}

output "cis_standard" {
  value = aws_securityhub_standards_subscription.cis.id
}