module "iam" {
  source = "./modules/iam"

  gcs_bucket_vault_license = module.object_storage.gcs_bucket_vault_license
  key_ring_id              = module.kms.key_ring_id
  resource_name_prefix     = var.resource_name_prefix
  tls_secret_id            = var.tls_secret_id
}

module "kms" {
  source = "./modules/kms"

  resource_name_prefix                   = var.resource_name_prefix
  user_supplied_kms_crypto_key_self_link = var.user_supplied_kms_crypto_key_self_link
  user_supplied_kms_key_ring_self_link   = var.user_supplied_kms_key_ring_self_link
}

module "load_balancer" {
  count  = var.create_load_balancer == true ? 1 : 0
  source = "./modules/load_balancer"

  instance_group        = module.vm.instance_group
  resource_name_prefix  = var.resource_name_prefix
  ssl_certificate_name  = var.ssl_certificate_name
  subnetwork            = module.networking.subnetwork
  vault_lb_health_check = var.vault_lb_health_check
}

module "networking" {
  source = "./modules/networking"

  networking_firewall_ports  = var.networking_firewall_ports
  networking_healthcheck_ips = var.networking_healthcheck_ips
  networking_ip_allow_list   = var.networking_ip_allow_list
  reserve_subnet_range       = var.reserve_subnet_range
  resource_name_prefix       = var.resource_name_prefix
  service_account            = module.iam.email
  ssh_source_ranges          = var.ssh_source_ranges
  subnetwork                 = var.subnetwork
}

module "object_storage" {
  source = "./modules/object_storage"

  resource_name_prefix   = var.resource_name_prefix
  vault_license_filepath = var.vault_license_filepath
  vault_license_name     = var.vault_license_name
}

module "user_data" {
  source = "./modules/user_data"

  crypto_key                  = module.kms.crypto_key_name
  gcs_bucket_vault_license    = module.object_storage.gcs_bucket_vault_license
  key_ring                    = module.kms.key_ring_name
  leader_tls_servername       = var.leader_tls_servername
  location                    = var.location
  project_id                  = var.project_id
  resource_name_prefix        = var.resource_name_prefix
  tls_secret_id               = var.tls_secret_id
  user_supplied_userdata_path = var.user_supplied_userdata_path
  vault_license_name          = module.object_storage.vault_license_name
  vault_version               = var.vault_version
}

module "vm" {
  source = "./modules/vm"

  disk_size            = var.vm_disk_size
  disk_source_image    = var.vm_disk_source_image
  disk_type            = var.vm_disk_type
  machine_type         = var.vm_machine_type
  node_count           = var.node_count
  resource_name_prefix = var.resource_name_prefix
  service_account      = module.iam.email
  subnetwork           = var.subnetwork
  userdata_script      = module.user_data.vault_userdata
}
