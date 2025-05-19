# EC2 Module

This module creates an EC2 instance with proper security configurations, root volume settings, and user data for basic web server setup.

## Usage

```hcl
module "ec2" {
  source = "../../modules/ec2"

  instance_type      = "t2.micro"
  subnet_id          = module.vpc.public_subnet_id
  security_group_id  = module.sg.security_group_id
  key_name           = "my-key-pair"
  volume_size        = 20
  volume_type        = "gp3"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| instance_type | The type of instance to start | string | t2.micro | no |
| subnet_id | The VPC Subnet ID to launch in | string | - | yes |
| security_group_id | The security group ID to associate with | string | - | yes |
| key_name | The key name of the Key Pair to use | string | - | yes |
| volume_size | Size of the root volume in gigabytes | number | 20 | no |
| volume_type | Type of root volume | string | gp3 | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | The ID of the EC2 instance |
| public_ip | The public IP address of the EC2 instance |
| private_ip | The private IP address of the EC2 instance |
| public_dns | The public DNS name of the EC2 instance |
| arn | The ARN of the EC2 instance |

## Features

- Creates an EC2 instance with Ubuntu 20.04 AMI
- Configures root volume with encryption
- Installs and configures nginx via user data
- Adds proper tags for resource management
- Validates instance type and volume configurations 