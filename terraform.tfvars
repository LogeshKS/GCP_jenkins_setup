projectid = "dulcet-glazing-444913-i8"
region = "us-central1"
vpcname = "jenkins-vpc"
routing_mode = "REGIONAL"

mtu = "1500"

public_subnetname = "jenkins-subnet"
public_subnet_cidr_range = "192.168.1.0/28"

jenkinshostname = "jenkins-host"
jenkinsimage = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
jenkinsmachinetype = "e2-standard-4"
jenkinstags = ["jenkins"]

