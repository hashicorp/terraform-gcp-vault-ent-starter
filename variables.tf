variable "create_load_balancer" {
  type        = bool
  default     = true
  description = "If true, creates a private load balancer. Set to false to disable the load balancer submodule"
}

variable "leader_tls_servername" {
  type        = string
  description = "One of the shared DNS SAN used to create the certs used for mTLS"
}

variable "location" {
  type        = string
  default     = "global"
  description = "Location of the kms key ring"
}

variable "networking_firewall_ports" {
  type        = list(string)
  default     = []
  description = "Additional ports to open in the firewall"
}

variable "networking_healthcheck_ips" {
  type        = list(string)
  default     = ["35.191.0.0/16", "130.211.0.0/22"]
  description = "Allowed IPs required for healthcheck. Provided by GCP"
}

variable "networking_ip_allow_list" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of allowed IPs for the firewall"
}

variable "node_count" {
  type        = number
  default     = 5
  description = "Number of Vault nodes to deploy"
}

variable "project_id" {
  type        = string
  description = "GCP project in which to launch resources"
}

variable "reserve_subnet_range" {
  type        = string
  default     = "10.1.0.0/16"
  description = "The IP address ranges for the https proxy range for the load balancer"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "ssh_source_ranges" {
  type        = list(string)
  default     = ["35.235.240.0/20"]
  description = "The source IP address ranges from which SSH traffic will be permitted; these ranges must be expressed in CIDR format. The default value permits traffic from GCP's Identity-Aware Proxy"
}

variable "ssl_certificate_name" {
  type        = string
  description = "Name of the created managed SSL certificate. Required when create_load_balancer is true"
}

variable "subnetwork" {
  type        = string
  description = "The self link of the subnetwork in which to deploy resources"
}

variable "tls_secret_id" {
  type        = string
  description = "Secret id/name given to the Google Secret Manager secret"
}

variable "user_supplied_kms_crypto_key_self_link" {
  type        = string
  description = "(Optional) Self link to user created kms crypto key"
  default     = null
}

variable "user_supplied_kms_key_ring_self_link" {
  type        = string
  description = "(Optional) Self link to user created kms key ring"
  default     = null
}

variable "user_supplied_userdata_path" {
  type        = string
  description = "(Optional) File path to custom userdata script being supplied by the user"
  default     = null
}

variable "vault_lb_health_check" {
  type        = string
  description = "The endpoint to check for Vault's health status"
  default     = "/v1/sys/health?activecode=200&standbycode=200&sealedcode=200&uninitcode=200"
}

variable "vault_license_name" {
  type        = string
  description = "The file name for the Vault license file"
  default     = "vault.hclic"
}

variable "vault_license_filepath" {
  type        = string
  description = "Filepath to location of Vault license file"
}

variable "vault_version" {
  type        = string
  default     = "1.8.1"
  description = "Vault version"
}

# VM VARS
variable "vm_machine_type" {
  type        = string
  default     = "n2-standard-4"
  description = "VM Machine Type"
}

variable "vm_disk_size" {
  type        = number
  default     = 500
  description = "VM Disk size"
}

variable "vm_disk_source_image" {
  type        = string
  default     = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
  description = "VM Disk source image"
}

variable "vm_disk_type" {
  type        = string
  default     = "pd-ssd"
  description = "VM Disk type. SSD recommended"
}

variable "storage_location" {
  type        = string
  default     = "us"
  description = "for bucket where license is stored"
}

