

###############################################################
# CloudTrail Log Bucket
###############################################################

resource "aws_s3_bucket" "cloudtrail" {

  bucket = "${local.project}-cloudtrail-logs-${data.aws_caller_identity.current.account_id}"

  tags = merge(
    local.common_tags,
    {
      Name = "Organization CloudTrail Logs"
    }
  )
}

###############################################################
# Bucket Versioning
###############################################################

resource "aws_s3_bucket_versioning" "cloudtrail" {

  bucket = aws_s3_bucket.cloudtrail.id

  versioning_configuration {
    status = "Enabled"
  }
}

###############################################################
# Block Public Access
###############################################################

resource "aws_s3_bucket_public_access_block" "cloudtrail" {

  bucket = aws_s3_bucket.cloudtrail.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

###############################################################
# Server Side Encryption
###############################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail" {

  bucket = aws_s3_bucket.cloudtrail.id

  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = aws_kms_key.cloudtrail.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

###############################################################
# Lifecycle Configuration
###############################################################

resource "aws_s3_bucket_lifecycle_configuration" "cloudtrail" {

  bucket = aws_s3_bucket.cloudtrail.id

  rule {

    id     = "ArchiveOldLogs"
    status = "Enabled"

    filter {}

    transition {
      days          = 90
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 3650
    }
  }
}