# Bucket outputs
output "static_website_bucket_name" {
  description = "Name of the static website bucket"
  value       = google_storage_bucket.static_website.name
}

output "static_website_bucket_url" {
  description = "Public URL of the static website"
  value       = "https://${google_storage_bucket.static_website.name}.storage.googleapis.com/index.html"
}

output "terraform_state_bucket_name" {
  description = "Name of the Terraform state bucket"
  value       = google_storage_bucket.terraform_state.name
}

# Service Account outputs
output "service_account_email" {
  description = "Email of the pipeline service account"
  value       = google_service_account.service_account.email
}

output "service_account_key" {
  description = "Private key for the pipeline service account (base64 encoded)"
  value       = google_service_account_key.pipeline_service_account_key.private_key
  sensitive   = true
}

# Project information
output "project_id" {
  description = "GCP Project ID"
  value       = var.gcp_project
}

output "bucket_region" {
  description = "Region where the buckets are located"
  value       = google_storage_bucket.static_website.location
}

output "static_website_url" {
  description = "Direct website URL (GCS website endpoint)"  
  value       = google_storage_bucket.static_website.website[0].main_page_suffix != "" ? "https://${google_storage_bucket.static_website.name}.storage.googleapis.com" : null
}