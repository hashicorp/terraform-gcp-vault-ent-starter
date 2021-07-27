resource "google_compute_instance_template" "vault" {
  name_prefix  = "${var.resource_name_prefix}-vault"
  machine_type = var.machine_type

  tags = ["${var.resource_name_prefix}-vault"]

  metadata_startup_script = var.userdata_script

  disk {
    source_image = var.disk_source_image
    auto_delete  = true
    boot         = true
    disk_size_gb = var.disk_size
    disk_type    = var.disk_type
    mode         = "READ_WRITE"
    type         = "PERSISTENT"
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  service_account {
    scopes = ["cloud-platform"]

    email = var.service_account
  }

  description          = "The instance template of the compute deployment for Vault."
  instance_description = "An instance of the compute deployment for Vault."

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "vault" {
  name = "${var.resource_name_prefix}-vault-group-manager"

  base_instance_name = "${var.resource_name_prefix}-vault-vm"

  target_size = var.node_count

  named_port {
    name = "https"
    port = 8200
  }

  version {
    instance_template = google_compute_instance_template.vault.self_link
  }
}
