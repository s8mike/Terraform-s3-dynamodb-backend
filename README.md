This project is to set up a Terraform module for creating an S3 bucket and a DynamoDB table to manage state files.
It will involve defining the directory structure, Terraform files, and the process to test and configure the backend to give a working configuration.
The directory structure for Terraform Configuration: This will help manage the Terraform configuration and modules efficiently as shown below:

S3_DynamoDB-project/
├── modules/          
│   └── s3-dynamodb/  
│       ├── variables.tf  
│       ├── outputs.tf  
│       └── versions.tf 
├── main.tf
├──terraform.tfvars   
├── README.md
├── .gitignore
├── cleanup.sh
├──s8mike-back-up/ This folder is meant to back all versions of files and folders
└── provider.tf        









Issues Encountered:
Had issues with my first code in the main.tf file where acl = "private" and "versioning" where said to be "deprecated" based on the version of the AWS provider in use. In newer versions of the AWS provider, the acl property is often replaced with more specific permission settings, such as aws_s3_bucket_object_acl or using IAM policies for more granular control. For example, the default ACL setting is private for an S3 bucket, so you might not need to specify it at all.

The versioning block is likely deprecated as well, and it's probably advised to use the aws_s3_bucket_versioning resource to handle versioning separately. This is a newer approach that allows more flexibility with versioning settings.
Key Changes:
Removed acl = "private": The acl property is not necessary, as the default ACL for S3 buckets is private.
Moved versioning to aws_s3_bucket_versioning: Instead of configuring versioning inside the aws_s3_bucket resource, it's now handled separately by the aws_s3_bucket_versioning resource.