#!/bin/bash

# Set your Google Cloud project ID
PROJECT_ID="my-flix-408803"

# Set the names of the instances you want to stop
INSTANCE_NAMES=("vm-login" "vm-videos" "vm-jenkins")

# Set the zones corresponding to each instance
INSTANCE_ZONES=("us-central1-a" "us-central1-b" "us-central1-c")

# Loop through each instance and stop it
for i in "${!INSTANCE_NAMES[@]}"; do
  INSTANCE_NAME="${INSTANCE_NAMES[i]}"
  INSTANCE_ZONE="${INSTANCE_ZONES[i]}"
  gcloud compute instances stop "${INSTANCE_NAME}" --project="${PROJECT_ID}" --zone="${INSTANCE_ZONE}"
done

