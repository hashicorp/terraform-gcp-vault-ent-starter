resource "random_id" "vault" {
  count       = var.user_supplied_kms_crypto_key_self_link != null && var.user_supplied_kms_key_ring_self_link != null ? 0 : 1
  byte_length = 4
}

resource "google_kms_key_ring" "key_ring" {
  count    = var.user_supplied_kms_crypto_key_self_link != null && var.user_supplied_kms_key_ring_self_link != null ? 0 : 1
  name     = "${var.resource_name_prefix}-vault-keyring-${random_id.vault[0].hex}"
  location = "global"
}

resource "google_kms_crypto_key" "vault_key" {
  count    = var.user_supplied_kms_crypto_key_self_link != null && var.user_supplied_kms_key_ring_self_link != null ? 0 : 1
  name     = "${var.resource_name_prefix}-vault-key-${random_id.vault[0].hex}"
  key_ring = google_kms_key_ring.key_ring[0].id
  purpose  = "ENCRYPT_DECRYPT"
}
