


resource "google_service_account" "service_account" {
  account_id   = "pipeline-service-account"
  display_name = "pipeline-service-account"
  project      = var.gcp_project
}

resource "google_service_account_key" "pipeline_service_account_key" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}


resource "google_project_iam_member" "pipeline_service_account_owner" {
  project = var.gcp_project
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}