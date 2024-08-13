# devops-infrastructure-terraform

This Terraform script is designed to provision a comprehensive AWS infrastructure for a DevOps environment. The infrastructure includes:

VPC: A Virtual Private Cloud with public subnets distributed across multiple availability zones.
Security Group: A security group with specified ingress and egress rules.

EC2 Instances: Instances for Jenkins, Terraform, and Maven-SonarQube servers, each with specific configurations and user data scripts.

DynamoDB Table: A DynamoDB table configured for state locking.

S3 Bucket: An S3 bucket with versioning enabled for storing state files.

ECR Repository: A private Elastic Container Registry (ECR) for storing Docker images.

Application Load Balancer (ALB): An ALB configured with HTTP and HTTPS listeners, using an ACM certificate for SSL/TLS termination.

Route 53 Hosted Zone: A Route 53 hosted zone for DNS management and validating the ACM certificate.

**Key Features**
Modular Architecture: Organized into reusable modules for VPC, EC2 instances, ALB, DynamoDB, S3, ECR, Route 53, and ACM.

High Availability: Uses multiple availability zones for public subnets and ALB.

Security: Configurable security group rules.

Automation: Includes user data scripts for automating instance configuration.

SSL/TLS: Requests and validates an ACM certificate for secure HTTPS access.

DNS Management: Uses Route 53 for DNS and ACM certificate validation.
