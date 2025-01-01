#firewall to allow http to jenkins from trusted ip
resource "google_compute_firewall" "allow_http_jenkins" {
    name = "allow-http-jenkins"
    network = google_compute_network.jenkinsvpc.id

    allow {
      protocol = "tcp"
      ports = ["8080", "9090", "22", "9000", "80"]
    }

    source_ranges = [google_compute_instance.jenkins_server.network_interface[0].network_ip]
    target_tags = var.jenkinstags

  depends_on = [ google_compute_instance.jenkins_server ]
}
