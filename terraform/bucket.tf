resource "google_storage_bucket" "static_website" {
  provider = google
  name     = var.gcp_bucket_name 
  location = "EU"
  
  uniform_bucket_level_access = true

  encryption {
    default_kms_key_name = google_kms_crypto_key.bucket_key.id
  }
  
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  
  force_destroy = true
}

# tfsec:ignore:google-storage-no-public-access reason: Public bucket required for static website hosting
resource "google_storage_bucket_iam_member" "public_rule" {
  bucket = google_storage_bucket.static_website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
  
}