#!/bin/bash
echo 'Runing Script ....'

# Exit immediately if a command exits with a non-zero status
set -e

set -o errexit

## Environment variables / Script Variables
path=$8


# Assign variables from the script arguments to terraform variables
script_var_resource_group_name=$1
script_var_location=$2
script_var_storage_account_name=$3
script_var_subscription_id=$4
script_var_client_id=$5
script_var_client_secret=$6
script_var_tenant_id=$7
script_var_path="$path/terraform/scripts"

# Navigate to the Terraform directory
cd $script_var_path

# Initialize Terraform
terraform init

# Apply the Terraform configuration
terraform apply -auto-approve -var "tenant_id=$script_var_tenant_id" -var "subscription_id=$script_var_subscription_id" -var "resource_group_name=$script_var_resource_group_name" -var "client_id=$script_var_client_id" -var "client_secret=$script_var_client_secret" -var "storage_account_name=$script_var_storage_account_name" -var "location=$script_var_location"