resource "aws_s3_bucket" "private_bucket" {
  count  = var.create ? 1 : 0
  bucket = var.bucket_name

  tags = {
    Name        = "MyPrivateBucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_acl" "private_acl" {
  count  = var.create ? 1 : 0
  bucket = aws_s3_bucket.private_bucket[0].id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  count  = var.create ? 1 : 0
  bucket = aws_s3_bucket.private_bucket[0].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  count  = var.create ? 1 : 0
  bucket = aws_s3_bucket.private_bucket[0].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.private_bucket.id

  rule {
    id     = "cleanup"
    status = "Enabled"

    expiration {
      days = 90
    }
  }
}

# Remove the following resources as they're redundant
# resource "aws_s3_bucket" "this" {
#   bucket = "${var.bucket_prefix}-${random_id.id.hex}"
#   acl    = "private"
#   tags = {
#     Purpose = "SecureAccess"
#   }
# }

# resource "random_id" "id" {
#   byte_length = 4
# }

