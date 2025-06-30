variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
  default     = "extended-pagoda-464212-q6"
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
  default     = "europe-west2"
}


variable "gcp_bucket_name" {
  description = "The name of the GCP storage bucket"
  type        = string
  default     = "static-website-34296"
}