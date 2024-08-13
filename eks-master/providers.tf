terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

variable "cluster_name" {
  default = "teamC-cluster"
}

variable "cluster_version" {
  default = "1.27"
}

output "cluster-name" {
  value       = aws_eks_cluster.cluster.name
  description = "The name of the EKS cluster."
}