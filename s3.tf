resource "aws_s3_bucket" "main" {
  bucket        = "s3-bucket-hrishi-12345"
  force_destroy = true   # ⭐ THIS is the key change

  tags = {
    Name        = "s3-bucket-hrishi"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
