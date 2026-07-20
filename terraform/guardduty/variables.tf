variable "aws_region" {
  default = "us-east-2"
}

variable "environment" {
  default = "dev"
}

variable "config_bucket_name" {
  description = "S3 bucket used by AWS Config."

  type = string
}