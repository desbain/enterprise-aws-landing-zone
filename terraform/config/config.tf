resource "aws_config_configuration_recorder" "this" {

  name     = "enterprise-config-recorder"
  role_arn = aws_iam_role.config.arn

  recording_group {
    all_supported = true

    include_global_resource_types = true
  }

}

resource "aws_config_delivery_channel" "this" {

  name           = "enterprise-config-channel"
  s3_bucket_name = aws_s3_bucket.config.bucket

  depends_on = [
    aws_config_configuration_recorder.this
  ]

}

resource "aws_config_configuration_recorder_status" "this" {

  name       = aws_config_configuration_recorder.this.name
  is_enabled = true

  depends_on = [
    aws_config_configuration_recorder.this,
    aws_s3_bucket_policy.config
  ]

}