terraform {
  required_version = ">= 0.15"

  required_providers {
    google = ">=2.0"
    tls    = ">= 3.0.0, < 4.0.0"
  }
}
