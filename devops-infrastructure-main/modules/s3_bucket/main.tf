resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name_prefix}-${random_id.bucket_suffix.hex}"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "this_versioning" {
  bucket = aws_s3_bucket.this.bucket

  versioning_configuration {
    status = var.versioning
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 8
}


