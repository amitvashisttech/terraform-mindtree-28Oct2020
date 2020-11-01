// INSTANCES
resource "google_compute_instance" "my-apache" {
  name         = "my-apache"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"
  tags = ["my-apache"]

  boot_disk {
    initialize_params {
      image = "apache-image-packer-1604221573"
    }
  }

  network_interface {
      network = "default"
      access_config {
          // Ephemeral IP
      }
  }
  count = 1
#  lifecycle = {
#    create_before_destroy = true
#  }
}

//
// NETWORKING
//
resource "google_compute_firewall" "fwrule" {
    name = "hyperspace-web"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    target_tags = ["my-apache"]
}

