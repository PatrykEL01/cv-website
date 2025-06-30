# Enable required APIs
resource "google_project_service" "storage_api" {
  project = var.gcp_project
  service = "storage.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "kms_api" {
  project = var.gcp_project
  service = "cloudkms.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "iam_api" {
  project = var.gcp_project
  service = "iam.googleapis.com"

  disable_on_destroy = false
}
