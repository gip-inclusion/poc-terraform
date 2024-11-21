terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.46.0"
      configuration_aliases = [
        scaleway.iam_manager,
        scaleway.projects_manager,
        scaleway.dns_manager,
      ]
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  alias           = "emplois"
  region          = var.scw_default_region
  zone            = var.scw_default_zone
  organization_id = var.scw_organization_id
  project_id      = scaleway_account_project.emplois.id
  access_key      = scaleway_iam_api_key.emplois.access_key
  secret_key      = scaleway_iam_api_key.emplois.secret_key
}
