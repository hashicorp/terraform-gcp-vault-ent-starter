output "gcs_bucket_vault_license" {
  value = google_storage_bucket.vault_license_bucket.name
}

output "vault_license_name" {
  value = var.vault_license_name
}
