# Terraform AWS VPC and Subnet Module

This Terraform module sets up an AWS VPC with configurable subnets (public and private), an Internet Gateway, and route tables based on the user's input. The module provides an easy way to define a VPC and its subnets, with automatic handling of Internet Gateway and route table association for public subnets.

## Features

- Create a VPC with a customizable CIDR block and name.
- Create multiple subnets within the VPC, each with configurable CIDR blocks and availability zones (AZs).
- Support for both public and private subnets.
- Automatically provision an Internet Gateway if there is at least one public subnet.
- Set up a public route table for public subnets and associate them.

## Usage

Below is an example of how to use this module in your Terraform configuration:

```hcl
module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "you_vpc_name"
  }

  subnet_config = {
    public_subnet_1 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-west-2a"
      public     = true
    }
    private_subnet_1 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-west-2a"
      # To set the subnet as public, default is private
      public     = false
    }
    public_subnet_2 = {
      cidr_block = "10.0.3.0/24"
      az         = "us-west-2b"
    }
  }
}
```
