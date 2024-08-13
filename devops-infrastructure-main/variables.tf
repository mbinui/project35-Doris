variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "ami_name_filter" {
  description = "The AMI name filter to use for finding the latest AMI"
  type        = string
}

variable "ami_owner" {
  description = "The owner ID of the AMI"
  type        = string
  default     = "099720109477"
}

variable "instance_type" {
  description = "The instance type to use for the instances"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
  default     = "production"
}

variable "jenkins_instance_name" {
  description = "The name tag for the Jenkins instance"
  type        = string
  default     = "Jenkins-Instance"
}

variable "terraform_instance_name" {
  description = "The name tag for the Terraform instance"
  type        = string
  default     = "Terraform-Instance"
}

variable "maven_sonarqube_instance_name" {
  description = "The name tag for the Maven-SonarQube instance"
  type        = string
  default     = "Maven-SonarQube-Instance"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)

}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)

}

variable "availability_zones" {
  description = "The availability zones for the subnets"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Name        = "teamc"
  }
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "my-alb"
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
  default     = "my-target-group"
}

variable "listener_port" {
  description = "The port for the ALB listener"
  type        = number
  default     = 80
}

variable "bucket_name_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
  default     = "teamc"
}

variable "versioning" {
  description = "The versioning status of the S3 bucket"
  type        = string
  default     = "Enabled"
}

variable "route53_zone_id" {
  description = "The Route 53 Hosted Zone ID for DNS validation"
  type        = string
}


variable "vpc_name" {
  description = "The name prefix for the VPC and related resources"
  type        = string
  default     = "teamc-vpc"
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
}

variable "ingress_rules" {
  description = "The ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "dynamodb_read_capacity" {
  description = "The read capacity units for the DynamoDB table"
  type        = number
}

variable "dynamodb_write_capacity" {
  description = "The write capacity units for the DynamoDB table"
  type        = number
}

variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "egress_rules" {
  description = "The egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}