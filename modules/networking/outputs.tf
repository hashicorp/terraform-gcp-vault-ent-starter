output "subnetwork" {
  value = var.subnetwork

  depends_on = [
    google_compute_subnetwork.reserve,
  ]
}
