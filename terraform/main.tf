 terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "minikube_host" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["minikube", "k8s-node"]

  metadata_startup_script = file("startup.sh")
}

resource "google_compute_firewall" "allow_k8s_ports" {
  name    = "allow-k8s-ports"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "8080", "30000-32767"]
  }

  target_tags   = ["minikube"]
  source_ranges = ["0.0.0.0/0"]
}