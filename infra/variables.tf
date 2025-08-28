variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "poc-eks-cluster"
}
