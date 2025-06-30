resource "google_kms_key_ring" "bucket_keyring" {
  name     = "bucket-keyring"
  location = "europe"
  project  = var.gcp_project
}

resource "google_kms_crypto_key" "bucket_key" {
  name     = "bucket-key"
  key_ring = google_kms_key_ring.bucket_keyring.id
  purpose  = "ENCRYPT_DECRYPT"


}

data "google_storage_project_service_account" "gcs_account" {
  project = var.gcp_project
}

resource "google_kms_crypto_key_iam_member" "storage_kms_key" {
  crypto_key_id = google_kms_crypto_key.bucket_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"
}

resource "google_kms_crypto_key_iam_member" "pipeline_kms_key" {
  crypto_key_id = google_kms_crypto_key.bucket_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_service_account.service_account.email}"
}
