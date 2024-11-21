resource "scaleway_domain_zone" "emplois" {
  provider   = scaleway.dns_manager
  domain     = var.root_domain
  subdomain  = "emplois"
  project_id = scaleway_account_project.emplois.id
}

resource "scaleway_domain_record" "txt_emplois" {
  provider = scaleway.dns_manager
  dns_zone = "${scaleway_domain_zone.emplois.subdomain}.${scaleway_domain_zone.emplois.domain}"
  name     = "_emplois_tf"
  type     = "TXT"
  data     = var.managed
  ttl      = 3600
}
