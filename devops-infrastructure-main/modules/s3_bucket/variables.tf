variable "bucket_name_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "versioning" {
  description = "The versioning status of the S3 bucket"
  type        = string
  default     = "Enabled"
}

variable "tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
  default     = {}
}
