resource "aws_s3_bucket" "config" {

  bucket = var.config_bucket_name

}

resource "aws_s3_bucket_versioning" "config" {

  bucket = aws_s3_bucket.config.id

  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_public_access_block" "config" {

  bucket = aws_s3_bucket.config.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

###############################################################
# S3 Server-Side Encryption
###############################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "config" {

  bucket = aws_s3_bucket.config.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

###############################################################
# S3 Lifecycle Configuration
###############################################################

resource "aws_s3_bucket_lifecycle_configuration" "config" {

  bucket = aws_s3_bucket.config.id

  rule {

    id     = "ArchiveOldConfig"
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