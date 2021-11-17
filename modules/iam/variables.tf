variable "gcs_bucket_vault_license" {
  type        = string
  description = "GCS bucket ID containing Vault license"
}

variable "key_ring_id" {
  type        = string
  description = "Self link of the KMS key ring"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "tls_secret_id" {
  type        = string
  description = "Secret id/name given to the google secrets manager secret"
}

variable "gcp_project" {
  type = string
  description = "GCP project"
}

