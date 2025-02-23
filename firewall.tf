#firewall to allow http to jenkins from trusted ip
resource "google_compute_firewall" "allow_ports_jenkins" {
    name = "allow-firewall-jenkins"
    network = google_compute_network.jenkinsvpc.id

    allow {
      protocol = "tcp"
      ports = ["8080", "9090", "22", "9000", "80"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = var.jenkinstags

  depends_on = [ google_compute_instance.jenkins_server ]
}
