variable "disk_size" {
  type        = number
  description = "VM Disk size"
}

variable "disk_source_image" {
  type        = string
  description = "VM Disk source image"
}

variable "disk_type" {
  type        = string
  description = "VM Disk type. SSD recommended"
}

variable "machine_type" {
  type        = string
  description = "VM Machine Type"
}

variable "node_count" {
  type        = number
  description = "Number of Vault nodes to deploy"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "service_account" {
  type        = string
  description = "Service account for Vault"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork self link in which to deploy instances"
}

variable "userdata_script" {
  type        = string
  description = "Userdata script for GCE instance"
}
