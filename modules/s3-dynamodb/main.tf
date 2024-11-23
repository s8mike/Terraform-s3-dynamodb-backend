# S3 Bucket Resource
resource "aws_s3_bucket" "state_bucket" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true  # Prevent accidental deletion
  }
}

# S3 Versioning Resource (configured separately)
resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB Table for State Locking
resource "aws_dynamodb_table" "lock_table" {
  name         = var.dynamodb_table_name
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  ttl {
    enabled        = true
    attribute_name = "expireAt"
  }

  tags = {
    Name = "State Lock Table"
  }
}