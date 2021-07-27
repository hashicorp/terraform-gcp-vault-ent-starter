output "network_name" {
  value       = module.test_vpc_module.network_name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = module.test_vpc_module.network_self_link
  description = "The URI of the VPC being created"
}

output "project" {
  value       = module.test_vpc_module.project_id
  description = "VPC project id"
}

output "subnetwork" {
  value       = module.test_vpc_module.subnets_self_links[0]
  description = "The self-link of subnet being created"
}

output "subnets_names" {
  value       = module.test_vpc_module.subnets_names
  description = "The names of the subnets being created"
}

output "subnets_ips" {
  value       = module.test_vpc_module.subnets_ips
  description = "The IP and cidrs of the subnets being created"
}

output "subnets_regions" {
  value       = module.test_vpc_module.subnets_regions
  description = "The region where subnets will be created"
}

output "subnets_private_access" {
  value       = module.test_vpc_module.subnets_private_access
  description = "Whether the subnets will have access to Google API's without a public IP"
}

output "subnets_flow_logs" {
  value       = module.test_vpc_module.subnets_flow_logs
  description = "Whether the subnets will have VPC flow logs enabled"
}

output "subnets_secondary_ranges" {
  value       = module.test_vpc_module.subnets_secondary_ranges
  description = "The secondary ranges associated with these subnets"
}

output "route_names" {
  value       = module.test_vpc_module.route_names
  description = "The routes associated with this VPC"
}
