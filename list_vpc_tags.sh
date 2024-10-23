#!/bin/bash

# Run Terraform commands
terraform init
terraform apply -auto-approve

# Capture output and write to a text file
terraform output -json vpc_tags | jq -r 'to_entries | .[] | "\(.key)=\(.value)"' > vpc_tags.txt

echo "VPC tags have been written to vpc_tags.txt"
