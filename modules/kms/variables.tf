variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "user_supplied_kms_crypto_key_self_link" {
  type        = string
  description = "Self link to user created kms crypto key"
}

variable "user_supplied_kms_key_ring_self_link" {
  type        = string
  description = "Self link to user created kms key ring"
}
