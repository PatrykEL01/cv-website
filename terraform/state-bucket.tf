resource "google_storage_bucket" "terraform_state" {
  provider = google
  name     = "${var.gcp_bucket_name}-terraform-state"  
  location = "EU"
  
  uniform_bucket_level_access = true
  
  encryption {
    default_kms_key_name = google_kms_crypto_key.bucket_key.id
  }
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
  
  # Ensure KMS permissions are set before creating bucket
  depends_on = [
    google_kms_crypto_key_iam_member.storage_kms_key,
    google_project_service.storage_api,
    google_project_service.kms_api
  ]
}