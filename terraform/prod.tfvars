aws_region             = "eu-central-1"
s3_bucket_name         = "patryk-leszczynski-portfolio-prod"
cloudfront_price_class = "PriceClass_100"
webiste_filename       = "index.html"

common_tags = {
  Environment = "prod"
  Project     = "PortfolioWebsite"
  ManagedBy   = "Terraform"
}
