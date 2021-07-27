resource "random_pet" "gcs" {
  length = 2
}

resource "google_storage_bucket" "vault_license_bucket" {
  name                        = "${var.resource_name_prefix}-vault-license-${random_pet.gcs.id}"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "vault_license" {
  name   = var.vault_license_name
  source = var.vault_license_filepath
  bucket = google_storage_bucket.vault_license_bucket.name
}
