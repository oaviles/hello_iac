variable "azure_rg" {
  description = "IaC_Workshop Resource Group"
  type        = string
  default     = "IaC-AKS-RG"
}

variable "aks_clustername" {
  description = "AKS Cluster Name"
  type        = string
  default     = "AKSCluster-Demo"
}

variable "aks_clustername_dnsprefix" {
  description = "AKS Cluster DNS Prefix"
  type        = string
  default     = "aksclusterdemo"
}