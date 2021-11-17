variable "resource_name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "vault_license_filepath" {
  type        = string
  description = "Filepath to location of Vault license file"
}

variable "vault_license_name" {
  type        = string
  description = "Filename for Vault license file"
}

variable "vault_storage_location" {
  type = string
  description = "where this bucket goes [us, eu, asia ..]"
  default = "us"
}

