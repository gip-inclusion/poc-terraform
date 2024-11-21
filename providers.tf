terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.46.0"
    }
  }
  required_version = ">= 0.13"
}

locals {
  root_domain = "inclusion.gouv.fr"
  managed     = "Managed by Terraform"
}

provider "scaleway" {
  alias           = "iam_manager"
  region          = var.scw_default_region
  zone            = var.scw_default_zone
  organization_id = var.scw_organization_id
  project_id      = var.scw_organization_id
  access_key      = var.scw_iam_manager_access_key
  secret_key      = var.scw_iam_manager_secret_key
}

provider "scaleway" {
  alias           = "projects_manager"
  region          = var.scw_default_region
  zone            = var.scw_default_zone
  organization_id = var.scw_organization_id
  project_id      = var.scw_organization_id
  access_key      = scaleway_iam_api_key.projects_manager.access_key
  secret_key      = scaleway_iam_api_key.projects_manager.secret_key
}

provider "scaleway" {
  alias           = "dns_manager"
  region          = var.scw_default_region
  zone            = var.scw_default_zone
  organization_id = var.scw_organization_id
  project_id      = var.scw_organization_id
  access_key      = scaleway_iam_api_key.dns_manager.access_key
  secret_key      = scaleway_iam_api_key.dns_manager.secret_key
}
