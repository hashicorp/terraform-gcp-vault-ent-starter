variable "network_name" {
  type        = string
  default     = "consul-test-network"
  description = "The name of the VPC network being created"
}

variable "project_id" {
  type        = string
  description = "The GCP project ID in which to launch resources"
}

variable "region" {
  type        = string
  description = "GCP region in which to launch resources"
}
