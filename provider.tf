terraform {
  required_providers {
    google ={
        source = "hashicorp/google"
        version = "~>6.0.0"
        
    }
  }
}


provider "google" {
  project = var.projectid
  region  = var.region  # Set the default region if needed (used for provider context)
  credentials = file("/home/logesh/Devops/dulcet-glazing-444913-i8-cf78e067d898.json")  # Path to your service account JSON credentials file
}