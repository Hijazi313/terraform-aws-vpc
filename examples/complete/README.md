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
