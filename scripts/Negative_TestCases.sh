#!/bin/sh
#cp to copy build code to folder containing config file

echo "==> Terraform initialization in process..."

sudo cp terraform-provider-opentelekomcloud /Positive_TestCases
terraform init ./Positive_TestCases

echo "==> Preparing for terraform apply..."

terraform apply -auto-approve ./Positive_TestCases

echo "==> Resource destroy in process..."

terraform destroy -force ./Positive_TestCases
