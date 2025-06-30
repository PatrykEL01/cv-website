resource "google_dns_managed_zone" "static_website_zone" {
  name        = "static-zone"
  dns_name    = var.domain
  description = "Static website DNS zone"
  labels = {
    environment = "production"
  }
  
  # Enable DNSSEC for enhanced security
  dnssec_config {
    state         = "on"
    non_existence = "nsec3"
  }
  
  depends_on = [
    google_project_service.dns_api
  ]
}

resource "google_dns_record_set" "www" {
  name         = "www.${var.domain}"
  managed_zone = var.dns_zone
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["${var.domain}"]
}
resource "google_dns_record_set" "root" {
  name         = "${var.domain}"
  managed_zone = var.dns_zone
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_global_forwarding_rule.static_https.ip_address]
}