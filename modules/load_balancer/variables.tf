variable "instance_group" {
  type        = string
  description = "The full URL of the instance group created by the manager"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "ssl_certificate_name" {
  type        = string
  description = "Name of the created managed SSL certificate. Required when create_load_balancer is true"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork self link in which to deploy instances"
}

variable "vault_lb_health_check" {
  type        = string
  description = "The endpoint to check for Vault's health status."
}
