# terraform-aws-default-vpc
Get default VPC and subnets data for your current region availability zones.

Default subnets data is returned in a map where each availability zone suffix is a key.

This is useful to feed default VPC and subnet references to other AWS resources.

## Example

```
provider "aws" {}

module "default_vpc" {
    source = "calidae/default-vpc/aws"
}

output "subnets_ids" {
  value       = { for suffix, subnet in module.default_vpc.subnets : suffix => subnet.id }
  description = "Subnets IDs"
}
```

This will output

```
Outputs:

subnets_ids = {
  "a" = "subnet-aaaaaaaa"
  "b" = "subnet-bbbbbbbb"
  "c" = "subnet-cccccccc"
  # etc
}
```
