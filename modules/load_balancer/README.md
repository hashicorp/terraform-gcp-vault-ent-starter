# GCP Load Balancer Module

## Required variables

* `instance_group` - string value of the full URL of the instance group created by the manager
* `resource_name_prefix` - string value to use as a unique identifier for resource names
* `ssl_certificate_name` - string value for the name of the SSL certificate to apply to the load balancer
* `subnetwork` - string value for the self link of the subnetwork in which to deploy resources
* `vault_lb_health_check` - string value of the Vault health check endpoint

## Example usage

```hcl
module "load_balancer" {
  count  = var.create_load_balancer == true ? 1 : 0
  source = "./modules/load_balancer"

  instance_group        = "https://www.googleapis.com/compute/v1/projects/project_id/regions/us-west1/instanceGroups/test-vault-group-manager"
  resource_name_prefix  = "test"
  ssl_certificate_name  = "vault-xxxxxxxxxxxxxxxx"
  subnetwork            = "https://www.googleapis.com/compute/v1/projects/project_id/regions/us-west1/subnetworks/subnet-01"
  vault_lb_health_check = "/v1/sys/health?activecode=200&standbycode=200&sealedcode=200&uninitcode=200"
}
```

## Considerations

To run the main module without building the internal HTTPS load balancer submodule, set the
`create_load_balancer` variable to `false`.
