
# Modular Terraform AWS Infrastructure

This setup uses modules to create:
- A VPC with subnets
- An EC2 instance
- A private S3 bucket

## Usage

```bash
terraform init
terraform plan
terraform apply
```

Set the required bucket name:
```bash
export TF_VAR_bucket_name="my-awesome-bucket-123456"
```
