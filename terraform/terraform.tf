terraform {
  required_version = ">= 1.0.0"

  backend "gcs" {
    bucket = "static-website-34296-terraform-state"
    prefix = "terraform/state"

  }
}