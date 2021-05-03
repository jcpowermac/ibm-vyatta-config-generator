#!/bin/bash


export PATH=$PATH:$(pwd)/bin/

terraform fmt -recursive
terraform init

terraform apply -auto-approve -var-file ./secrets/terraform.tfvars
