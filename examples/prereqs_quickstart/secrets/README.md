# EXAMPLE: TLS Configuration on Load Balancer and Vault Nodes

## About This Example

The Vault installation module requires an SSL certificate for the creation of the
[internal HTTPS load balancer](https://cloud.google.com/load-balancing/docs/l7-internal#ssl_certificates).
It also requires TLS certificates on all Vault nodes in the cluster. If you
do not already have existing TLS certs that you can use for these requirements,
you can use the example code in this directory to create them and upload them to
[GCP Secret Manager](https://cloud.google.com/secret-manager/docs/overview) as well as create the necessary [SSL certificate](https://cloud.google.com/load-balancing/docs/ssl-certificates) for the load balancer.

## How to Use This Module

- Ensure your GCP credentials are [configured
   correctly](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication)
- Enable the [Secret Manager API](https://cloud.google.com/secret-manager/docs/reference/rest)
- Configure required (and optional if desired) variables
- Run `terraform init` and `terraform apply`

### Security Note:
- The [Terraform State](https://www.terraform.io/docs/language/state/index.html)
  produced by this code has sensitive data (cert private keys) stored in it.
  Please secure your Terraform state using the [recommendations listed
  here](https://www.terraform.io/docs/language/state/sensitive-data.html#recommendations).

## Required variables

* `project_id` - Name of the GCP project in which to deploy resources
* `region` - GCP region to deploy resources into

## Note

- Please note the following output produced by this Terraform as this
  information will be required input for the Vault installation module:
   - `leader_tls_servername`
   - `ssl_certificate_name`
   - `tls_secret_id`
