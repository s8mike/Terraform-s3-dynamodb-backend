# Declare variables for the root module
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
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


# Call the s3_dynamodb module
module "s3_dynamodb" {
  source             = "./modules/s3-dynamodb"
  bucket_name       = var.bucket_name    # Reference the variable
  dynamodb_table_name = var.dynamodb_table_name  # Reference the variable
}

# Outputs (optional)
output "s3_bucket_name" {
  value = module.s3_dynamodb.bucket_name
}

output "dynamodb_table_name" {
  value = module.s3_dynamodb.dynamodb_table_name
}