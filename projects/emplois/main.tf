resource "scaleway_account_project" "emplois" {
  provider    = scaleway.projects_manager
  name        = "Emplois for Terraform Setup"
  description = var.managed
}
