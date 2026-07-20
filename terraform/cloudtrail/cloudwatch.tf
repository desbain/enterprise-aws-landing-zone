###############################################################
# CloudTrail CloudWatch Log Group
###############################################################

resource "aws_cloudwatch_log_group" "cloudtrail" {
  name              = "/aws/cloudtrail/${var.trail_name}"
  retention_in_days = 365

  kms_key_id = aws_kms_key.cloudtrail.arn
}