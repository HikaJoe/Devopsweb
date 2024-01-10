provider "google" {
    credentials = file("/Users/JosephHika/Desktop/oldschool kenyan/my-flix-408803-ff3b879d55de.json")
    project     = "my-flix-408803"
    region      = "us-central1"
}

resource "google_compute_instance" "vm-login" {
    name         = "vm-login"
    machine_type = "n1-standard-4"
    zone         = "us-central1-a"

    # Create a boot disk using an image
    boot_disk {
        initialize_params {
           image = "cos-cloud/cos-101-17162-336-43"
           size = 10
        }
    }

    # Create a network interface with a NAT IP
    network_interface {
        network = "default"
    }


}

resource "google_compute_instance" "vm-videos" {
    name         = "vm-videos"
    machine_type = "n1-standard-4"
    zone         = "us-central1-b"

    # Create a boot disk using an image
    boot_disk {
        initialize_params {
            image = "cos-cloud/cos-101-17162-336-43"
            size = 10
        }
    }

    # Create a network interface with a NAT IP
    network_interface {
        network = "default"
    }
}

resource "google_compute_instance" "vm-jenkins" {
    name         = "vm-jenkins"
    machine_type = "n1-standard-4"
    zone         = "us-central1-c"

    # Create a boot disk using an image
    boot_disk {
        initialize_params {
            image = "projects/cos-cloud/global/images/cos-101-17162-336-43"
            size = 10
            type  = "pd-balanced"
        }
    mode = "READ_WRITE"
    }

    # Create a network interface with a NAT IP
    network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
 subnetwork = "projects/my-flix-408803/regions/us-central1/subnetworks/default"
}

}


