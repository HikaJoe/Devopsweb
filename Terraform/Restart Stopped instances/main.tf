provider "google" {
  credentials = file("/Users/JosephHika/Desktop/oldschool kenyan/my-flix-408803-ff3b879d55de.json")
  project     = "my-flix-408803"
  region      = "us-central1"
}

# Define the instances to restart with their corresponding zones
variable "instance_zones" {
  description = "Map of instance names to their corresponding zones"
  type        = map(string)
  default     = {
    "vm-login"   = "us-central1-a",
    "vm-videos" = "us-central1-b",
   "vm-jenkins" = "us-central1-c",
  }
}

# Use local-exec provisioner to restart the instances
resource "null_resource" "restart_instances" {
  provisioner "local-exec" {
    command = <<-EOT
      gcloud compute instances start ${join(" ", keys(var.instance_zones))} \
        --project=${var.project} \
        --zone=${values(var.instance_zones)[0]}  # Use the zone of the first instance
    EOT
  }
}
variable "project" {
  description = "my-flix-408803"
  type        = string
}