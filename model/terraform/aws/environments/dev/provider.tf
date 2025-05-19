terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = data.external.aws_creds.result["AWS_ACCESS_KEY_ID"]
  secret_key = data.external.aws_creds.result["AWS_SECRET_ACCESS_KEY"]
}
