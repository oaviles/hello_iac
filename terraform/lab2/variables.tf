variable "azure_rg" {
  description = "IaC_Workshop Resource Group"
  type        = string
  default     = "PoC_TF"
}

variable "aks_clustername" {
  description = "AKS Cluster Name"
  type        = string
  default     = "AKSCluster-TF"
}

variable "aks_clustername_dnsprefix" {
  description = "AKS Cluster DNS Prefix"
  type        = string
  default     = "aksclustertf"
}

variable "azure_location" {
  description = "Azure Region"
  type        = string
  default     = "West US"
}
