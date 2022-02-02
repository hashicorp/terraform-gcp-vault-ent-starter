# GCP Networking Module

## Required variables

* `networking_healthcheck_ips` - string value for the allowed IPs required for health check. Provided by GCP
* `reserve_subnet_range` - string value for the IP address ranges for the https proxy range for the load balancer
* `resource_name_prefix` - string value to use as a unique identifier for resource names
* `service_account` - string value for the service account email
* `ssh_source_ranges` - string value for the source IP address ranges from which SSH traffic will be permitted; these ranges must be expressed in CIDR format
* `subnetwork` - string value for the self link of the subnetwork in which to deploy resources

## Example usage

```hcl
module "networking" {
  source = "./modules/networking"

  networking_healthcheck_ips = ["35.191.0.0/16", "130.211.0.0/22"]
  reserve_subnet_range       = "10.1.0.0/16"
  resource_name_prefix       = "test"
  service_account            = "test-vault@project_id.iam.gserviceaccount.com"
  ssh_source_ranges          = "["35.235.240.0/20"]"
  subnetwork                 = "https://www.googleapis.com/compute/v1/projects/project_id/regions/us-west1/subnetworks/subnet-01"
}
```
