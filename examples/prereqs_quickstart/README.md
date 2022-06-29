# EXAMPLE: Prerequisite Configuration (VPC and Secrets)

## About This Example

In order to deploy the Vault Enterprise module, you must have a GCP VPC that
meets the requirements [listed in the main
README](../../README.md#how-to-use-this-module) along with TLS certs that can be
used with the Vault nodes and load balancer. If you do not already have these
resources, you can use the code provided in this directory to provision them.

## How to Use This Module

1. Ensure GCP credentials are in [place](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication) (e.g. `gcloud auth application-default login` on your workstation)
2. Configure required (and optional if desired) variables
3. Run `terraform init` and `terraform apply`

## Required variables

* `project_id` - The GCP project ID in which to launch resources
* `region` - The GCP region in which to launch resources

### Security Note:
- The [Terraform State](https://www.terraform.io/docs/language/state/index.html)
  produced by this code has sensitive data (cert private keys) stored in it.
  Please secure your Terraform state using the [recommendations listed
  here](https://www.terraform.io/docs/language/state/sensitive-data.html#recommendations).
