###############################################################
# CloudTrail ARN
###############################################################

output "cloudtrail_arn" {
  value = aws_cloudtrail.organization.arn
}

###############################################################
# CloudTrail Bucket
###############################################################

output "cloudtrail_bucket" {
  value = aws_s3_bucket.cloudtrail.bucket
}

###############################################################
# KMS Key ARN
###############################################################

output "kms_key_arn" {
  value = aws_kms_key.cloudtrail.arn
}

###############################################################
# CloudWatch Log Group
###############################################################

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.cloudtrail.name
}