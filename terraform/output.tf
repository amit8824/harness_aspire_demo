output "instance_external_ip" {
  value = google_compute_instance.minikube_host.network_interface[0].access_config[0].nat_ip
}