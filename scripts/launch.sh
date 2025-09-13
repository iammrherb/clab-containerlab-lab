#!/bin/bash
# Launch script for Containerlab Lab
set -e

echo "Launching Containerlab Lab lab..."

# Find .clab.yml file
CLAB_FILE=$(find . -name "*.clab.yml" -type f | head -1)

if [ -z "$CLAB_FILE" ]; then
    echo "No .clab.yml file found"
    exit 1
fi

echo "Using topology file: $CLAB_FILE"

# Deploy the lab
containerlab deploy --topo "$CLAB_FILE"

echo "Lab deployed successfully!"
containerlab inspect --topo "$CLAB_FILE"
