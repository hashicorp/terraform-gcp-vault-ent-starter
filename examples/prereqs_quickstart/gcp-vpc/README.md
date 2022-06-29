# EXAMPLE: Create a Prerequisite VPC Network

## About This Example

In order to deploy the Vault Enterprise module, a preconfigured VPC network must first be deployed. This example points to an existing module that can be configured to deploy a Vault ready VPC.
Module documentation can be found [here](https://registry.terraform.io/modules/terraform-google-modules/network/google/latest).

## Network Design for Vault Enterprise
The prerequisite VPC Network for Vault Enterprise should contain the following:

- Cloud Router and Cloud NAT: necessary for downloading Vault

- Google Compute Network: manages a VPC network

- Subnet: a single subnet in which to deploy the Vault cluster

## How to Use This Module

- Ensure GCP credentials are in [place](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication) (e.g. `gcloud auth application-default login` on your workstation).

- Enable the following APIs in the Cloud Console:

  - [Compute Engine API](https://cloud.google.com/compute/docs/reference/rest/v1)

  - [Cloud Resource Manager API](https://cloud.google.com/resource-manager/reference/rest)

- Configure required (and optional if desired) variables

- Run `terraform init` and `terraform apply`

## Required inputs

### For the module:

* `network_name` - Name of network

* `project_id` - ID of the project in GCP

* `subnets` - List of subnets to create

* `subnet_name` - The name of the subnet being created

* `subnet_ip` - The IP and CIDR range of the subnet being created

* `subnet_region` - The region where the subnet will be created

### For NAT resources:

#### [google_compute_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router)

* `name` - Name of the resource

* `network` - Reference to the network to which this router belongs

#### [google_compute_router_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat)

* `name` - Name of the NAT service

* `nat_ip_allocate_option` - How external IPs should be allocated for this NAT. Valid values are AUTO_ONLY for only allowing NAT IPs allocated by Google Cloud Platform, or MANUAL_ONLY for only user-allocated NAT IP addresses. Possible values are MANUAL_ONLY and AUTO_ONLY

* `source_subnetwork_ip_ranges_to_nat` - How NAT should be configured per Subnetwork. Possible values include ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS

* `router` - The name of the Cloud Router in which this NAT will be configured
