resource "scaleway_iam_application" "emplois" {
  provider    = scaleway.iam_manager
  name        = "Emplois project Admin"
  description = var.managed
}

resource "scaleway_iam_api_key" "emplois" {
  provider       = scaleway.iam_manager
  application_id = scaleway_iam_application.emplois.id
  description    = var.managed
}

resource "scaleway_iam_group" "emplois" {
  provider    = scaleway.iam_manager
  name        = "Emplois project Admins"
  description = var.managed
}

resource "scaleway_iam_group_membership" "emplois" {
  provider       = scaleway.iam_manager
  group_id       = scaleway_iam_group.emplois.id
  application_id = scaleway_iam_application.emplois.id
}

resource "scaleway_iam_policy" "emplois" {
  provider    = scaleway.iam_manager
  name        = "Emplois project Administration"
  description = var.managed
  group_id    = scaleway_iam_group.emplois.id
  rule {
    project_ids          = [scaleway_account_project.emplois.id]
    permission_set_names = ["AllProductsFullAccess"]
  }
}
