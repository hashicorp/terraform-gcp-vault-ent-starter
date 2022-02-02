# GCP Object Storage Module

## Required variables

* `resource_name_prefix` - string value to use as a unique identifier for resource names
* `storage_location` - string value of the GCS location
* `vault_license_filepath` - string value of the filepath to location of Vault license file
* `vault_license_name` - string value of the filename for Vault license file

## Example usage

```hcl
module "object_storage" {
  source = "./modules/object_storage"

  resource_name_prefix   = "test"
  storage_location       = "US"
  vault_license_filepath = "/Users/user/Downloads/vault.hclic"
  vault_license_name     = "vault.hclic"
}
```
