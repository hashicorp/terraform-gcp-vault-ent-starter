terraform {
  required_version = ">= 1.2.1"

  required_providers {
    google      = "< 5.0, >=4.0"
    google-beta = "< 5.0, >=4.0"
    random      = ">=3.0"
  }
}
