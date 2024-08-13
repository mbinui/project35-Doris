terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "infra/terraformstatefile"
    bucket         = "teamc-5db7d832d9b9de8f"
    region         = "us-east-2"
    dynamodb_table = "teamC-state-locking"
  }
}