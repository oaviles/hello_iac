variable "azure_rg" {
  description = "IaC_Workshop Resource Group"
  type        = string
  default     = "PoC_Zone"
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
