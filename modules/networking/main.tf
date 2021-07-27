data "google_compute_subnetwork" "subnetwork" {
  self_link = var.subnetwork
}

resource "google_compute_subnetwork" "reserve" {
  provider = google-beta

  name          = "${var.resource_name_prefix}-reserve"
  ip_cidr_range = var.reserve_subnet_range
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
  role          = "ACTIVE"
  network       = data.google_compute_subnetwork.subnetwork.network
}

resource "google_compute_firewall" "allow_internal" {
  name    = "${var.resource_name_prefix}-vault-allow-internal"
  network = data.google_compute_subnetwork.subnetwork.network

  allow {
    protocol = "tcp"
    ports    = ["8200", "8201"]
  }
  source_tags = ["${var.resource_name_prefix}-vault"]
  target_tags = ["${var.resource_name_prefix}-vault"]
}

resource "google_compute_firewall" "lb_proxy" {
  name          = "${var.resource_name_prefix}-proxy-firewall"
  network       = data.google_compute_subnetwork.subnetwork.network
  source_ranges = [var.reserve_subnet_range]

  target_service_accounts = [var.service_account]

  allow {
    protocol = "tcp"
    ports    = ["8200", "443"]
  }
}

resource "google_compute_firewall" "lb_healthchecks" {
  name          = "${var.resource_name_prefix}-lb-healthcheck-firewall"
  network       = data.google_compute_subnetwork.subnetwork.network
  source_ranges = var.networking_healthcheck_ips

  target_service_accounts = [var.service_account]

  allow {
    protocol = "tcp"
    ports    = ["8200"]
  }
}

resource "google_compute_firewall" "ssh" {
  name    = "${var.resource_name_prefix}-ssh-firewall"
  network = data.google_compute_subnetwork.subnetwork.network

  description   = "The firewall which allows the ingress of SSH traffic to Vault instances"
  direction     = "INGRESS"
  source_ranges = var.ssh_source_ranges

  target_service_accounts = [var.service_account]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
