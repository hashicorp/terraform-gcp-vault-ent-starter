variable "networking_firewall_ports" {
  type        = list(string)
  description = "Additional ports to open in the firewall"
}

variable "networking_healthcheck_ips" {
  type        = list(string)
  description = "Allowed IPs required for healthcheck. Provided by GCP"
}

variable "networking_ip_allow_list" {
  type        = list(string)
  description = "List of allowed IPs for the firewall"
}

variable "reserve_subnet_range" {
  type        = string
  description = "proxy-only subnet for internal http(s) load balancer"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "service_account" {
  type        = string
  description = "Target service account for firewall rules"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork self link in which to deploy instances"
}

variable "ssh_source_ranges" {
  type        = list(string)
  description = "The source IP address ranges from which SSH traffic will be permitted; these ranges must be expressed in CIDR format. The default value permits traffic from GCP's Identity-Aware Proxy"
}
