# Vault Enterprise GCP Module

This is a Terraform module for provisioning Vault Enterprise with [integrated
storage](https://www.vaultproject.io/docs/concepts/integrated-storage) on GCP.
This module defaults to setting up a cluster with 5 Vault nodes (as recommended
by the [Vault with Integrated Storage Reference
Architecture](https://learn.hashicorp.com/vault/operations/raft-reference-architecture)).

## About This Module
This module implements the [Vault with Integrated Storage Reference
Architecture](https://learn.hashicorp.com/vault/operations/raft-reference-architecture#node)
on GCP using the Enterprise version of Vault 1.8+.

## How to Use This Module

- Ensure your GCP credentials are [configured
  correctly](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication)
  and have permission to use the following GCP services:
    - [Cloud Resource Manager API](https://cloud.google.com/resource-manager/reference/rest)
    - [Compute Engine API](https://cloud.google.com/compute/docs/reference/rest/v1)
    - GCP Identity & Access Management (IAM)
    - [GCP Key Management System API](https://cloud.google.com/kms/docs/reference/rest)
    - GCP Cloud Storage
    - Google Cloud Load Balancing
    - GCP SSL Certificates
    - [Secret Manager API](https://cloud.google.com/secret-manager/docs/reference/rest)

- To deploy without an existing VPC, use the [example VPC](https://github.com/hashicorp/terraform-gcp-vault-ent-starter/tree/main/examples/gcp-vpc)
  code to build out the pre-requisite environment. Ensure you are selecting a
  region that has at least three [
  zones](https://cloud.google.com/compute/docs/regions-zones).

- To deploy into an existing VPC, ensure the following components exist and are
  routed to each other correctly:
  - Google Compute Network: manages a VPC network
  - Subnet: a single subnet in which to deploy the Vault cluster
  - One Cloud Router and [Cloud NAT](https://cloud.google.com/nat/docs/overview)

- Use the [example](https://github.com/hashicorp/terraform-gcp-vault-ent-starter/tree/main/examples/gcp-tls) code to create TLS certs
  and store them in [GCP Secret Manager](https://cloud.google.com/secret-manager/docs/overview)
  along with importing them into a [GCP self managed SSL Certificate](https://cloud.google.com/load-balancing/docs/ssl-certificates)

- Create a Terraform configuration that pulls in the Vault module and specifies
  values for the required variables:

```hcl
provider "google" {
  project = "my-project-id"
  region  = "us-west1"
}

provider "google-beta" {
  project = "my-project-id"
  region  = "us-west1"
}

module "vault-ent" {
  source               = "hashicorp/vault-ent-starter/gcp"
  version              = "0.1.2"

  # The shared DNS SAN of the TLS certs being used
  leader_tls_servername  = "vault.server.com"
  #Your GCP project ID
  project_id             = "my-project-id"
  # Your GCP region
  region                 = "us-west1"
  # Prefix for uniquely identifying GCP resources
  resource_name_prefix   = "test"
  # Self link of the subnetwork you wish to deploy into
  subnetwork             = "https://www.googleapis.com/compute/v1/projects/my-project-id/regions/us-west1/subnetworks/subnet-01"
  # Name of the SSL Certificate to be used for Vault LB
  ssl_certificate_name   = "vault-xxxxxxxxxxxxxxxx"
  # Secret id/name given to the google secret manager secret
  tls_secret_id          = "terraform_example_module_vault_tls_secret"
  # Path to Vault Enterprise license file
  vault_license_filepath = "/Users/user/Downloads/vault.hclic"
}
```

  - Run `terraform init` and `terraform apply`

  - You must
    [initialize](https://www.vaultproject.io/docs/commands/operator/init#operator-init)
    your Vault cluster after you create it. Begin by logging into your Vault
    cluster:
      - SSH: you must provide a cidr range value for the `ssh_source_ranges` variable.
        The default value is a range provided by google for use with the
        [Identity-Aware Proxy](https://cloud.google.com/iap) service.
          - Please note this Vault cluster is not public-facing. If you want to
            use SSH from outside the VPC, you are required to establish your own
            connection to it (VPN, etc).

  - To initialize the Vault cluster, run the following commands:

```
$ sudo -i
# vault operator init
```

  - This should return back the following output which includes the recovery
    keys and initial root token (omitted here):

```
...
Success! Vault is initialized
```

  - Please securely store the recovery keys and initial root token that Vault
    returns to you.
  - To check the status of your Vault cluster, export your Vault token and run
    the
    [list-peers](https://www.vaultproject.io/docs/commands/operator/raft#list-peers)
    command:

```
# export VAULT_TOKEN="<your Vault token>"
# vault operator raft list-peers
```

- Please note that Vault does not enable [dead server
  cleanup](https://www.vaultproject.io/docs/concepts/integrated-storage/autopilot#dead-server-cleanup)
  by default. You must enable this to avoid manually managing the Raft
  configuration every time there is a change in the Vault MIG. To enable dead
  server cleanup, run the following command:

 ```
# vault operator raft autopilot set-config \
    -cleanup-dead-servers=true \
    -dead-server-last-contact-threshold=10 \
    -min-quorum=3
 ```

- You can verify these settings after you apply them by running the following command:

```
# vault operator raft autopilot get-config
```

## License

This code is released under the Mozilla Public License 2.0. Please see
[LICENSE](https://github.com/hashicorp/terraform-gcp-vault-ent-starter/blob/main/LICENSE) for more details.
