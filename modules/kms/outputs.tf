output "crypto_key_name" {
  value = var.user_supplied_kms_crypto_key_self_link != null && var.user_supplied_kms_key_ring_self_link != null ? element(split("/", var.user_supplied_kms_crypto_key_self_link), length(split("/", var.user_supplied_kms_crypto_key_self_link)) - 1) : element(split("/", google_kms_crypto_key.vault_key[0].id), length(split("/", google_kms_crypto_key.vault_key[0].id)) - 1)
}

output "key_ring_id" {
  value = var.user_supplied_kms_crypto_key_self_link != null && var.user_supplied_kms_key_ring_self_link != null ? var.user_supplied_kms_key_ring_self_link : google_kms_key_ring.key_ring[0].id
}

output "key_ring_name" {
  value = var.user_supplied_kms_crypto_key_self_link != null && var.user_supplied_kms_key_ring_self_link != null ? element(split("/", var.user_supplied_kms_key_ring_self_link), length(split("/", var.user_supplied_kms_key_ring_self_link)) - 1) : element(split("/", google_kms_key_ring.key_ring[0].id), length(split("/", google_kms_key_ring.key_ring[0].id)) - 1)
}
