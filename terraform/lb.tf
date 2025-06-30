resource "google_compute_url_map" "static" {
  name            = "static-url-map"
  default_service = google_compute_backend_bucket.static.id
}

resource "google_compute_managed_ssl_certificate" "cert" {
  name = "static-cert"
  managed {
    domains = [var.domain, "www.${var.domain}"]
  }
}

resource "google_compute_target_https_proxy" "static" {
  name             = "static-https-proxy"
  url_map          = google_compute_url_map.static.id
  ssl_certificates = [google_compute_managed_ssl_certificate.cert.id]
}

resource "google_compute_global_address" "static_ip" {
  name = "static-ip"
}

resource "google_compute_global_forwarding_rule" "static_https" {
  name                  = "static-https-fw"
  ip_address            = google_compute_global_address.static_ip.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.static.id
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_backend_bucket" "static" {
  name        = "static-backend"
  bucket_name = google_storage_bucket.static_website.name
  enable_cdn  = true
}