provider "aws" {
  region = "us-east-1"  # You can change this to your preferred region
}

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"  # Adjust based on the latest stable release
    }
  }
}