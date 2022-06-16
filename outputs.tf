output "vpc" {
  value = data.aws_vpc.default
}

output "subnets" {
  value = data.aws_subnet.default
}
