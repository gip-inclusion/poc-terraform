# Create an application to manage projects, no access to resources
# Permissions: ProjectManager only

resource "scaleway_iam_application" "projects_manager" {
  provider    = scaleway.iam_manager
  name        = "Projects Manager"
  description = local.managed
}

resource "scaleway_iam_api_key" "projects_manager" {
  provider       = scaleway.iam_manager
  application_id = scaleway_iam_application.projects_manager.id
  description    = local.managed
}

resource "scaleway_iam_group" "projects_managers" {
  provider    = scaleway.iam_manager
  name        = "Projects Managers"
  description = local.managed
}

resource "scaleway_iam_group_membership" "projects_manager" {
  provider       = scaleway.iam_manager
  group_id       = scaleway_iam_group.projects_managers.id
  application_id = scaleway_iam_application.projects_manager.id
}

resource "scaleway_iam_policy" "projects_manager" {
  provider    = scaleway.iam_manager
  name        = "Projects Management"
  description = local.managed
  group_id    = scaleway_iam_group.projects_managers.id
  rule {
    organization_id      = var.scw_organization_id
    permission_set_names = ["ProjectManager"]
  }
}

# Create an application to manage dns, no access to resources
# Permissions: DomainsDNSFullAccess only

resource "scaleway_iam_application" "dns_manager" {
  provider    = scaleway.iam_manager
  name        = "DNS Manager"
  description = local.managed
}

resource "scaleway_iam_api_key" "dns_manager" {
  provider       = scaleway.iam_manager
  application_id = scaleway_iam_application.dns_manager.id
  description    = local.managed
}

resource "scaleway_iam_group" "dns_managers" {
  provider    = scaleway.iam_manager
  name        = "DNS Managers"
  description = local.managed
}

resource "scaleway_iam_group_membership" "dns_manager" {
  provider       = scaleway.iam_manager
  group_id       = scaleway_iam_group.dns_managers.id
  application_id = scaleway_iam_application.dns_manager.id
}

resource "scaleway_iam_policy" "dns_manager" {
  provider    = scaleway.iam_manager
  name        = "DNS Management"
  description = local.managed
  group_id    = scaleway_iam_group.dns_managers.id
  rule {
    organization_id      = var.scw_organization_id
    permission_set_names = ["DomainsDNSFullAccess"]
  }
}
