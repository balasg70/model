# Security Group Module

This module creates a security group with proper ingress and egress rules for web servers and database access.

## Usage

```hcl
module "sg" {
  source = "../../modules/sg"

  vpc_id          = module.vpc.vpc_id
  ssh_cidr_blocks = ["10.0.0.0/16"]  # Restrict SSH access to VPC CIDR
  vpc_cidr_blocks = ["10.0.0.0/16"]
  environment     = "dev"
  name_prefix     = "allow"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vpc_id | The VPC ID | string | - | yes |
| ssh_cidr_blocks | List of CIDR blocks to allow SSH access from | list(string) | ["0.0.0.0/0"] | no |
| vpc_cidr_blocks | List of CIDR blocks for the VPC | list(string) | ["10.0.0.0/16"] | no |
| environment | Environment tag for the security group | string | dev | no |
| name_prefix | Prefix for the security group name | string | allow | no |

## Outputs

| Name | Description |
|------|-------------|
| security_group_id | The ID of the security group |
| security_group_arn | The ARN of the security group |
| security_group_name | The name of the security group |
| security_group_description | The description of the security group |

## Features

- Creates a security group with proper ingress rules
- Allows SSH access from specified CIDR blocks
- Allows HTTP and HTTPS access from anywhere
- Allows RDS access from VPC CIDR blocks
- Configures proper egress rules
- Adds descriptive tags
- Uses proper naming conventions 