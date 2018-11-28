variable "project_name" {}
variable "billing_account" {}
variable "region" {
  default = "europe-north1"
}
variable "machine_type" {
  default = "n1-standard-1"
}
variable "network_cidr" {
  default = "10.11.12.0/24"
}

variable "cloudflare_email" {}
variable "cloudflare_token" {}
variable "cloudflare_domain" {}
