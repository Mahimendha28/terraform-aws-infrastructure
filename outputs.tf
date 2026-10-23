output "environment" {
  value = var.environment
}

output "instance_count" {
  value = var.instance_count
}

output "monitoring_enabled" {
  value = var.monitoring_enabled
}

output "allowed_environments" {
  value = var.allowed_environments
}

output "project_tags" {
  value = var.project_tags
}

output "app_config" {
  value = var.app_config
}

output "module_app_config" {
  value = module.app_config_demo.app_config
}

output "staging_app_config" {
  value = module.app_config_staging.app_config
}
output "network_demo_vpc_id" {
  description = "VPC ID from the network module"
  value       = module.network_demo.vpc_id
}

output "network_demo_public_subnet_ids" {
  description = "Public subnet IDs from the network module"
  value       = module.network_demo.public_subnet_ids
}
output "network_demo_private_subnet_ids" {
  description = "Private subnet IDs from the network module"
  value       = module.network_demo.private_subnet_ids
}
output "network_demo_app_security_group_id" {
  description = "Application security group ID from the network module"
  value       = module.network_demo.app_security_group_id
}
