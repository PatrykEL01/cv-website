resource "google_storage_bucket" "terraform_state" {
  provider = google
  name     = "${var.gcp_bucket_name}-terraform-state"  
  location = "EU"
  
  uniform_bucket_level_access = true
  
  versioning {
    enabled = true
  }
  
  public_access_prevention = "enforced"
  
  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
}