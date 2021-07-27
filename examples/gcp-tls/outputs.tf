output "leader_tls_servername" {
  value       = var.shared_san
  description = "Shared SAN that will be given to the Vault nodes configuration for use as leader_tls_servername"
}

output "ssl_certificate_name" {
  value       = google_compute_region_ssl_certificate.main.name
  description = "Name of the ssl certificate resource"
}

output "tls_secret_id" {
  value       = var.tls_secret_id
  description = "Secret id/name given to the Google Secret Manager secret"
}
