variable "crypto_key" {
  type        = string
  description = "The GCP CKMS crypto key to use for encryption and decryption"
}

variable "gcs_bucket_vault_license" {
  type        = string
  description = "GCS bucket ID containing Vault license"
}

variable "key_ring" {
  type        = string
  description = "The GCP CKMS key ring to use for Vault auto-unseal"
}

variable "leader_tls_servername" {
  type        = string
  description = "One of the shared DNS SAN used to create the certs use for mTLS"
}

variable "location" {
  type        = string
  description = "Location of the GCP CKMS key ring"
}

variable "project_id" {
  type        = string
  description = "GCP project in which to launch resources"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "tls_secret_id" {
  type        = string
  description = "Secret id/name given to the google secret manager secret"
}

variable "user_supplied_userdata_path" {
  type        = string
  description = "File path to custom userdata script being supplied by the user"
}

variable "vault_license_name" {
  type        = string
  description = "Name of Vault license file"
}

variable "vault_version" {
  type        = string
  description = "Vault version"
}
