# IMPORTANT: Before running terraform init:
# 1. Create an S3 bucket for state storage
# 2. Create a DynamoDB table for state locking
# 3. Replace the placeholder values below with your actual values

terraform {
  backend "s3" {
    bucket         = "demo-terraform-state-2024"    # Replace with your unique bucket name
    key            = "terraform.tfstate"
    region         = "us-east-1"                    # Must match your provider region
    encrypt        = true
    dynamodb_table = "terraform-state-lock"         # Table name for state locking
  }
}