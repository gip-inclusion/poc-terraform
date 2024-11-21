resource "scaleway_iam_application" "demo" {
  provider    = scaleway.iam_manager
  name        = "Demo project Admin"
  description = var.managed
}

resource "scaleway_iam_api_key" "demo" {
  provider       = scaleway.iam_manager
  application_id = scaleway_iam_application.demo.id
  description    = var.managed
}

resource "scaleway_iam_group" "demo" {
  provider    = scaleway.iam_manager
  name        = "Demo project Admins"
  description = var.managed
}

resource "scaleway_iam_group_membership" "demo" {
  provider       = scaleway.iam_manager
  group_id       = scaleway_iam_group.demo.id
  application_id = scaleway_iam_application.demo.id
}

resource "scaleway_iam_policy" "demo" {
  provider    = scaleway.iam_manager
  name        = "Demo project Administration"
  description = var.managed
  group_id    = scaleway_iam_group.demo.id
  rule {
    project_ids          = [scaleway_account_project.demo.id]
    permission_set_names = ["AllProductsFullAccess"]
  }
}
