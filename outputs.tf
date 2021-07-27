output "lb_address" {
  value       = module.load_balancer[0].address
  description = "Load Balancer Address"
}
