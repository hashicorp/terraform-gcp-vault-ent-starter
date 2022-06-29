provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source = "./gcp-vpc/"

  network_name = var.network_name
  project_id   = var.project_id
  region       = var.region
}

module "secrets" {
  source = "./secrets/"

  region = var.region
}
