variable "scw_default_region" {
  type        = string
  description = "Scaleway default region"
  default     = "fr-par"
}

variable "scw_default_zone" {
  type        = string
  description = "Scaleway default zone"
  default     = "fr-par-1"
}

variable "scw_organization_id" {
  type        = string
  description = "Scaleway GIP organization id"
}

variable "scw_iam_manager_access_key" {
  type        = string
  description = "Scaleway IAM Manager application access key"
}

variable "scw_iam_manager_secret_key" {
  type        = string
  description = "Scaleway IAM Manager application secret key"
}
