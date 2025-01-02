resource "google_compute_network" "jenkinsvpc" {

    name = var.vpcname
    project = var.projectid
    auto_create_subnetworks = "false"
    routing_mode = var.routing_mode
    mtu = var.mtu  
    
}

resource "google_compute_subnetwork" "public_subnet" {
    name = var.public_subnetname
    ip_cidr_range = var.public_subnet_cidr_range
    region = var.region
    network = google_compute_network.jenkinsvpc.id
    private_ip_google_access = false

    depends_on = [ google_compute_network.jenkinsvpc ]
}




