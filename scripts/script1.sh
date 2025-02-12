#!/bin/bash
echo 'Runing Script ....'

# Exit immediately if a command exits with a non-zero status
set -e

set -o errexit

## Environment variables / Script Variables
script_var_tenant_id="$tenant_id"
script_var_subscription_id="$subscription_id"
script_var_resource_group_name="$resource_group_name"
script_var_client_id="$client_id"
script_var_client_secret="$client_secret"
script_var_location="$location"
script_var_storage_account_name="$storage_account_name"

# Navigate to the Terraform directory
cd ./terraform/scripts

# Initialize Terraform
terraform init

# Create an execution plan
#terraform plan

# Apply the Terraform configuration
#terraform apply "tfplan" -auto-approve

terraform apply \
  -auto-approve \
  -var "tenant_id=$script_var_tenant_id" \
  -var "subscription_id=$script_var_subscription_id" \
  -var "resource_group_name=$script_var_resource_group_name" \
  -var "client_id=$script_var_client_id" \
  -var "client_secret=$script_var_client_secret" \
  -var "storage_account_name=$script_var_storage_account_name" \
  -var "location=$script_var_location"