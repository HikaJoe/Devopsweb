provider "google" {
    credentials = file("/Users/JosephHika/Desktop/oldschool kenyan/my-flix-408803-ff3b879d55de.json")
    project     = "my-flix-408803"
    region      = "us-central1"
}

resource "google_compute_instance" "vm-login" {
    name         = "vm-login"
    machine_type = "c3d-standard-4"
    zone         = "us-central1-a"

    # Create a boot disk using an image
    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
        }
    }

    # Create a network interface with a NAT IP
    network_interface {
        network = "default"
    }
}

resource "google_compute_instance" "vm-videos" {
    name         = "vm-videos"
    machine_type = "c3d-standard-4"
    zone         = "us-central1-b"

    # Create a boot disk using an image
    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
        }
    }

    # Create a network interface with a NAT IP
    network_interface {
        network = "default"
    }
}

resource "google_compute_instance" "vm-jenkins" {
    name         = "vm-jenkins"
    machine_type = "c3d-standard-4"
    zone         = "us-central1-c"

    # Create a boot disk using an image
    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
        }
    }

    # Create a network interface with a NAT IP
    network_interface {
        network = "default"
    }
}