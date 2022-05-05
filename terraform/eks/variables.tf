variable "AWS_REGION" {
  type        = string
  description = "Target AWS region."
  default     = "us-west-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
  default     = "Arc-EKS-Demo"
}
