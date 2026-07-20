###############################################################
# AWS Organizations
###############################################################

data "aws_organizations_organization" "current" {}

###############################################################
# Organization CloudTrail
###############################################################

resource "aws_cloudtrail" "organization" {

  name           = var.trail_name
  s3_bucket_name = aws_s3_bucket.cloudtrail.id

  kms_key_id = aws_kms_key.cloudtrail.arn

  is_organization_trail = true
  is_multi_region_trail = true

  include_global_service_events = true
  enable_log_file_validation    = true

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.cloudtrail.arn}:*"
  cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail_cloudwatch.arn

  depends_on = [
    aws_s3_bucket.cloudtrail,
    aws_kms_key.cloudtrail,
    aws_cloudwatch_log_group.cloudtrail,
    aws_iam_role.cloudtrail_cloudwatch
  ]

  tags = merge(
    local.common_tags,
    {
      Name = var.trail_name
    }
  )
}