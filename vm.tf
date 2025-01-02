resource "google_compute_instance" "jenkins_server" {
  name         = var.jenkinshostname
  machine_type = var.jenkinsmachinetype
  zone         = "${var.region}-a"

  tags = var.jenkinstags

  boot_disk {
    initialize_params {
      image = var.jenkinsimage
      size = 30
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.id
    access_config {}
  }

  service_account {
    email  = "terraform-sa@dulcet-glazing-444913-i8.iam.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform"  // Full access to all Google Cloud services
    ]
  }

  metadata_startup_script = file("/home/logesh/Devops/GCP_jenkins_setup/jenkinsstartup.sh")
}