output "web1_public_dns" {
  value = module.add-11-module_web.web1_public_dns
}

output "web2_public_dns" {
  value = module.add-11-module_web.web2_public_dns
}

output "was1_public_dns" {
  value = module.add-11-module_was.was1_public_dns
}

output "was2_public_dns" {
  value = module.add-11-module_was.was2_public_dns
}

output "rds_cluster_endpoint" {
  value = module.add-11-module_rds.rds_endpoint
}