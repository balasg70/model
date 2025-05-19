# S3 Module

This module creates a private S3 bucket with versioning, encryption, lifecycle rules, and proper access controls.

## Usage

```hcl
module "s3" {
  source = "../../modules/s3"

  bucket_name         = "my-unique-bucket-name"
  versioning_enabled  = true
  lifecycle_rule_days = 90
  environment         = "dev"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| bucket_name | The name of the bucket. Must be globally unique | string | - | yes |
| versioning_enabled | Enable versioning for the bucket | bool | true | no |
| lifecycle_rule_days | Number of days after which objects will be expired | number | 90 | no |
| environment | Environment tag for the bucket | string | dev | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket region-specific domain name |
| bucket_website_endpoint | The website endpoint, if configured |

## Features

- Creates a private S3 bucket
- Enables versioning by default
- Configures server-side encryption with AES256
- Blocks all public access
- Sets up lifecycle rules for object expiration
- Adds proper tags for resource management
- Validates bucket naming conventions 