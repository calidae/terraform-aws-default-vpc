provider "aws" {}

module "default_vpc" {
  source = "calidae/default-vpc/aws"
}

output "subnets_ids" {
  value       = { for suffix, subnet in module.default_vpc.subnets : suffix => subnet.id }
  description = "Subnets IDs"
}
