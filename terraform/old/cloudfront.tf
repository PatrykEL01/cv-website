resource "aws_cloudfront_distribution" "portfolio-website-cloudfront" {
  enabled             = true
  default_root_object = var.webiste_filename

  origin {
    origin_id   = aws_s3_bucket.portfolio-website-s3.id
    domain_name = aws_s3_bucket_website_configuration.portfolio-website-s3-website.website_endpoint
    

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }
  default_cache_behavior {
    target_origin_id       = aws_s3_bucket.portfolio-website-s3.id
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  price_class = var.cloudfront_price_class

  tags = var.common_tags
}