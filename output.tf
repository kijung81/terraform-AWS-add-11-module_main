output "web1_public_dns" {
  value = module.web.web1_public_dns
}

output "web2_public_dns" {
  value = module.web.web2_public_dns
}

output "was1_public_dns" {
  value = module.was.was1_public_dns
}

output "was2_public_dns" {
  value = module.was.was2_public_dns
}

output "rds_cluster_endpoint" {
  value = module.rds.rds_endpoint
}