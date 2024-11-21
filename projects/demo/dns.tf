resource "scaleway_domain_zone" "demo" {
  provider   = scaleway.dns_manager
  domain     = var.root_domain
  subdomain  = "demo"
  project_id = scaleway_account_project.demo.id
}

resource "scaleway_domain_record" "txt_demo" {
  provider = scaleway.dns_manager
  dns_zone = "${scaleway_domain_zone.demo.subdomain}.${scaleway_domain_zone.demo.domain}"
  name     = "_demo_tf"
  type     = "TXT"
  data     = var.managed
  ttl      = 3600
}
