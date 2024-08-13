variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "tags" {
  description = "Tags for the ECR repository"
  type        = map(string)
  default     = {}
}
