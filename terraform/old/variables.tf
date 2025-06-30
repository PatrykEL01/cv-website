variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "eu-central-1"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for the portfolio website."
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default = {
    Project   = "PortfolioWebsite"
    ManagedBy = "Terraform"
  }
}

variable "cloudfront_price_class" {
  description = "The price class for the CloudFront distribution."
  type        = string
  default     = "PriceClass_100"
}

variable "webiste_filename" {
  description = "The name of the index file for the website."
  type        = string
  default     = "index.html"
}
variable "website_error_filename" {
  description = "The name of the error file for the website."
  type        = string
  default     = "error.html"
}