resource "google_kms_key_ring" "bucket_keyring" {
  name     = "bucket-keyring"
  location = "europe"
}

resource "google_kms_crypto_key" "bucket_key" {
  name            = "bucket-key"
  key_ring        = google_kms_key_ring.bucket_keyring.id
  rotation_period = "100000s"
}
