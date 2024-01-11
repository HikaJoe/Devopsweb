# main.tf

provider "google" {
  credentials = file("/Users/JosephHika/Desktop/oldschool kenyan/my-flix-408803-ff3b879d55de.json")
  project     = "my-flix-408803"
  region      = "us-central1"
}

resource "google_compute_instance" "vm" {
    name = "vm-login"
    machine_type = "n1-standard-4"
    zone         = "us-central1-a"

    boot_disk {
        initialize_params {
           image = "projects/ubuntu-os-pro-cloud/global/images/ubuntu-pro-1604-xenial-v20231213"
           size = 10
            type  = "pd-balanced"
        }
        mode = "READ_WRITE"
    }


    network_interface {
    access_config {
        network_tier = "PREMIUM"
    }

    subnetwork = "projects/my-flix-408803/regions/us-central1/subnetworks/default"
    
    }
}



resource "google_container_cluster" "kubernetes_cluster" {
  name     = "my-cluster"
  location = "us-central1"

  initial_node_count = 3
}
