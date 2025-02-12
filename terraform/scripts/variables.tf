variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "client_id" {
  description = "The client ID for the Azure service principal"
  type        = string
}

variable "client_secret" {
  description = "The client secret for the Azure service principal"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The tenant ID for Azure"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}