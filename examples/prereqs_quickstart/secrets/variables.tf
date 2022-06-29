variable "project_id" {
  type        = string
  description = "The project ID in which to build resources"
}

variable "region" {
  type        = string
  description = "GCP region in which to launch resources"
}

variable "shared_san" {
  type        = string
  description = "This is a shared server name that the certs for all Vault nodes contain. This is the same value you will supply as input to the Vault installation module for the leader_tls_servername variable"
  default     = "vault.server.com"
}

variable "tls_secret_id" {
  type        = string
  description = "Secret id/name given to the google secrets manager secret"
  default     = "terraform_example_module_vault_tls_secret"
}
