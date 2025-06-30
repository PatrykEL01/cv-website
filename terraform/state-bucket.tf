resource "google_storage_bucket" "terraform_state" {
  provider = google
  name     = var.gcp_bucket_name 
  location = "EU"
}