resource "scaleway_account_project" "demo" {
  provider    = scaleway.projects_manager
  name        = "Demo for Terraform Setup"
  description = var.managed
}
