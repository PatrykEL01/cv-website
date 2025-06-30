resource "google_storage_bucket" "static_website" {
  provider = google
  name     = var.gcp_bucket_name 
  location = "EU"
}

# Make new objects public
resource "google_storage_default_object_access_control" "website_read" {
  bucket = google_storage_bucket.static_website.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket_iam_member" "public_rule" {
  bucket = google_storage_bucket.static_website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}