variable "project_id" {
  type        = string
  description = "The project ID to host the network in"
}

variable "network_name" {
  type        = string
  description = "The name of the VPC network being created"
  default     = "vault-test-network"
}

variable "region" {
  type        = string
  description = "GCP region in which to launch resources"
  default     = "us-west1"
}
