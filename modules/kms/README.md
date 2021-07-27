# GCP KMS Module

## Required variables

* `resource_name_prefix` - string value to use as a unique identifier for resource names
* `user_supplied_kms_crypto_key_self_link` - string value of the self link to the user created crypto key. set to null if not supplying a preconfigured crypto key
* `user_supplied_kms_key_ring_self_link` - string value of the self link of the user created key ring. set to null if not supplying a preconfigured key ring

## Example usage

```hcl
module "kms" {
  source = "./modules/kms"

  resource_name_prefix                   = "test"
  user_supplied_kms_crypto_key_self_link = "key_ring/cryptoKeys/name"
  user_supplied_kms_key_ring_self_link   = "projects/project_id/locations/global/keyRings/name"
}
```

## Considerations

To supply your own KMS key ring and key, you may pass the self links to the variables `user_supplied_kms_key_ring_self_link` and `user_supplied_kms_crypto_key_self_link`. The KMS key ring and key creation will be skipped if you supply your own KMS resources.
