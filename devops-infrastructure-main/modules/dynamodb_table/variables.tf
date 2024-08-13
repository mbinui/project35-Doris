variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "read_capacity" {
  description = "Read capacity for the DynamoDB table"
  type        = number
}

variable "write_capacity" {
  description = "Write capacity for the DynamoDB table"
  type        = number
}

variable "tags" {
  description = "Tags for the DynamoDB table"
  type        = map(string)
  default = {
    Name        = "finance-state-locking"
    Environment = "dev"
  }
}
