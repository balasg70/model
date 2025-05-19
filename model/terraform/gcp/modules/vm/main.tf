resource "google_compute_instance" "vm_instance" {
  name         = "linux-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork    = var.subnet_id
    access_config {}
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF

  tags = ["web"]

  labels = {
    env = "dev"
  }
}
