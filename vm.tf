resource "google_compute_instance" "jenkins_server" {
  name         = var.jenkinshostname
  machine_type = var.jenkinsmachinetype
  zone         = "${var.region}-a"

  tags = var.jenkinstags

  boot_disk {
    initialize_params {
      image = var.jenkinsimage
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.id
    access_config {}
  }

  metadata_startup_script = file("/home/logesh/Devops/GCP_jenkins_setup/jenkinsstartup.sh")
}