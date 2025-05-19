resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  target_tags = ["web"]
}
