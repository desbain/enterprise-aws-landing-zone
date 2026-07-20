output "config_bucket_name" {

  value = aws_s3_bucket.config.bucket

}

output "config_recorder_name" {

  value = aws_config_configuration_recorder.this.name

}

output "config_role_arn" {

  value = aws_iam_role.config.arn

}