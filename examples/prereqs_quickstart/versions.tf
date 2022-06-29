terraform {
  required_version = ">= 1.2.1"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 5.0, >= 3.83"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "< 5.0, >= 3.45"
    }
    tls = ">= 3.0.0, < 4.0.0"
  }
}
