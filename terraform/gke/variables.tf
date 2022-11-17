variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "gcpcredentials" {
  description = "GCP Project credentials filename"
  type        = string
}

variable "gcp_region" {
  description = "GCP region where resource will be created"
  type        = string
  default     = "us-central1"
}

variable "gke_cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "gkecluster-demo"
}

variable "admin_username" {
  description = "GKE control plane administrator username"
  type        = string
}

variable "admin_password" {
  description = "GKE control plane administrator username"
  type        = string
}

variable "gke_cluster_node_count" {
  description = "GKE cluster node count"
  type        = number
  default     = 1
}

variable "gke_cluster_node_machine_type" {
  description = "GKE cluster node machine type"
  type        = string
  default     = "n1-standard-2"
}
