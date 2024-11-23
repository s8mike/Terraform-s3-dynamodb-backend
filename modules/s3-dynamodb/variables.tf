variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "s8mike-s3dynamodb-bucket"  # Default value (you can override in terraform.tfvars)
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "s8mike-dynamodb-lock-Table"  # Default value (you can override in terraform.tfvars)
}

variable "aws_region" {
  description = "The name of the region"
  type        = string
  default     = "us-east-1"  # Default value (you can override in terraform.tfvars)
}

variable "tags" {
  description = "The name of the for the resources"
  type        = string
  default     = "state lock table"  # Default value (you can override in terraform.tfvars)
}

variable "environment" {
  description = "The name of the environment resources is deployed"
  type        = string
  default     = "development"  # Default value (you can override in terraform.tfvars)
}