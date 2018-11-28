resource "google_compute_network" "default" {
  name                    = "default-network"
  auto_create_subnetworks = false
  project                 = "${google_project_services.project.project}"
}

resource "google_compute_subnetwork" "default" {
  name          = "default-subnetwork"
  ip_cidr_range = "${var.network_cidr}"
  region        = "${var.region}"
  network       = "${google_compute_network.default.self_link}"
  project       = "${google_project_services.project.project}"
}
