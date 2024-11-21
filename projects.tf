module "demo_project" {
  source = "./projects/demo"

  scw_default_zone    = var.scw_default_zone
  scw_default_region  = var.scw_default_region
  scw_organization_id = var.scw_organization_id
  root_domain         = local.root_domain
  managed             = local.managed

  providers = {
    scaleway.iam_manager      = scaleway.iam_manager
    scaleway.projects_manager = scaleway.projects_manager
    scaleway.dns_manager      = scaleway.dns_manager
  }
}

#module "transverse_project" {
#  source = "./projects/transverse"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "emplois_project" {
#  source = "./projects/emplois"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "if_project" {
#  source = "./projects/immersion_facilitee"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "rdvi_project" {
#  source = "./projects/rdv_insertion"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "pilotage_project" {
#  source = "./projects/pilotage"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "marche_project" {
#  source = "./projects/marche"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "dora_project" {
#  source = "./projects/dora"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "di_project" {
#  source = "./projects/data_inclusion"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "communaute_project" {
#  source = "./projects/communaute"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "ic_project" {
#  source = "./projects/inclusion_connect"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}

#module "mon_recap_project" {
#  source = "./projects/mon_recap"
#  common_variables = local.common
#  providers = {
#    scaleway.iam_manager = scaleway.iam_manager
#    scaleway.projects_manager = scaleway.projects_manager
#    scaleway.dns_manager = scaleway.dns_manager
#  }
#}
