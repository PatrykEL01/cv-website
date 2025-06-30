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

resource "google_project_service" "dns_api" {
  project = var.gcp_project
  service = "dns.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "compute_api" {
  project = var.gcp_project
  service = "compute.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "certificatemanager_api" {
  project = var.gcp_project
  service = "certificatemanager.googleapis.com"

  disable_on_destroy = false
}
