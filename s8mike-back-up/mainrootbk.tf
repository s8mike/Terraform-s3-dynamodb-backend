# # Declare variables for the root module
# variable "bucket_name" {
#   description = "The name of the S3 bucket"
#   type        = string
# }

# variable "dynamodb_table_name" {
#   description = "The name of the DynamoDB table for state locking"
#   type        = string
# }

# # Call the s3_dynamodb module
# module "s3_dynamodb" {
#   source             = "./modules/s3-dynamodb"
#   bucket_name       = var.bucket_name    # Reference the variable
#   dynamodb_table_name = var.dynamodb_table_name  # Reference the variable
# }

# # Outputs (optional)
# output "s3_bucket_name" {
#   value = module.s3_dynamodb.bucket_name
# }

# output "dynamodb_table_name" {
#   value = module.s3_dynamodb.dynamodb_table_name
# }