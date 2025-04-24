resource "aws_s3_bucket" "portfolio-website-s3" {
  bucket = var.s3_bucket_name

  tags = var.common_tags
}

resource "aws_s3_bucket_public_access_block" "portfolio-website_public_access_block" {
  bucket = aws_s3_bucket.portfolio-website-s3.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_acl" "portfolio-website-s3-acl" {
  depends_on = [aws_s3_bucket.portfolio-website-s3, aws_s3_bucket_public_access_block.portfolio-website_public_access_block]
  bucket     = aws_s3_bucket.portfolio-website-s3.id
  acl        = "public-read"

}

resource "aws_s3_bucket_website_configuration" "portfolio-website-s3-website" {
  bucket = aws_s3_bucket.portfolio-website-s3.id

  index_document {
    suffix = var.webiste_filename
  }

  error_document {
    key = var.website_error_filename
  }

}