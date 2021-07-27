# GCP VM Module

## Required variables

* `disk_size` - string value of the VM disk size
* `disk_source_image` - string value of the VM source image
* `disk_type` - string value of the VM disk type
* `machine_type` - string value of the VM machine type
* `node_count` - number value of Vault nodes to deploy
* `resource_name_prefix` - string value to use as a unique identifier for resource names
* `service_account` - string value for the service account email address
* `subnetwork` - string value for the self link of the subnetwork in which to deploy resources
* `userdata_script` - string value for the user data script to apply to Vault instances

## Example usage

```hcl
module "vm" {
  source = "./modules/vm"

  disk_size            = 100
  disk_source_image    = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
  disk_type            = "pd-ssd"
  machine_type         = "n2-standard-4"
  node_count           = 5
  resource_name_prefix = "test"
  service_account      = "test-vault@project_id.iam.gserviceaccount.com"
  subnetwork           = "https://www.googleapis.com/compute/v1/projects/project_id/regions/us-west1/subnetworks/subnet-01"
  userdata_script      = "<<-EOT #!/usr/bin/env bash ..." #This will be the full user data script for the instance
}
```
