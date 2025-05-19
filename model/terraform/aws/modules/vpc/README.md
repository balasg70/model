# VPC Module

This module creates a VPC with public and private subnets in different availability zones, along with necessary route tables and Internet Gateway.

## Usage

```hcl
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vpc_cidr | CIDR block for the VPC | string | - | yes |
| public_subnet_cidr | CIDR block for the public subnet | string | - | yes |
| private_subnet_cidr | CIDR block for the private subnet | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| public_subnet_id | The ID of the public subnet |
| private_subnet_id | The ID of the private subnet |
| public_route_table_id | The ID of the public route table |
| private_route_table_id | The ID of the private route table |
| internet_gateway_id | The ID of the Internet Gateway |

## Features

- Creates a VPC with DNS support and hostnames enabled
- Creates public and private subnets in different availability zones
- Creates an Internet Gateway for public subnet access
- Creates route tables for both subnets
- Associates route tables with subnets
- Adds proper tags to all resources 