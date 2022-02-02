# GCP IAM Module

## Required variables

* `gcs_bucket_vault_license` - GCS bucket ID containing Vault license
* `key_ring_id` - string value of the self link to the kms crypto key
* `project_id` - string value of the GCP project in which to launch resources
* `resource_name_prefix` - string value to use as a unique identifier for resource names
* `tls_secret_id` - string value of the secret id/name given to the Google Secret Manager secret

## Example usage

```hcl
module "iam" {
  source = "./modules/iam"

  gcs_bucket_vault_license = "test-vault-license"
  key_ring_id              = "projects/project_id/locations/global/keyRings/test-vault-keyring"
  project_i                = "project_id"
  resource_name_prefix     = "test"
  tls_secret_id            = "terraform_example_module_vault_tls_secret"
}
```
