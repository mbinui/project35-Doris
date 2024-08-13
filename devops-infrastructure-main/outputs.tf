output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "jenkins_instance_id" {
  description = "The ID of the Jenkins instance"
  value       = module.jenkins_server.instance_id
}

output "jenkins_instance_public_ip" {
  description = "The public IP of the Jenkins instance"
  value       = module.jenkins_server.instance_public_ip
}

output "terraform_instance_id" {
  description = "The ID of the Terraform instance"
  value       = module.terraform_server.instance_id
}

output "terraform_instance_public_ip" {
  description = "The public IP of the Terraform instance"
  value       = module.terraform_server.instance_public_ip
}

output "maven_sonarqube_instance_id" {
  description = "The ID of the Maven-SonarQube instance"
  value       = module.maven_sonarqube_server.instance_id
}

output "maven_sonarqube_instance_public_ip" {
  description = "The public IP of the Maven-SonarQube instance"
  value       = module.maven_sonarqube_server.instance_public_ip
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = module.dynamodb_table.table_name
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_bucket.bucket_arn
}

output "repository_url" {
  description = "The URL of the ECR repository"
  value       = module.ecr_repository.repository_url
}

output "repository_arn" {
  description = "The ARN of the ECR repository"
  value       = module.ecr_repository.repository_arn
}

# output "certificate_arn" {
#   description = "The ARN of the ACM certificate"
#   value       = module.acm_certificate.certificate_arn
# }

output "security_group_id" {
  value = module.security_group.sg_id
}

