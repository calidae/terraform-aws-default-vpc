data "aws_availability_zones" "all" {
}

data "aws_availability_zone" "all" {
  name     = each.key
  for_each = toset(data.aws_availability_zones.all.names)
}

data "aws_subnet" "default" {
  availability_zone = each.value
  default_for_az    = true
  for_each = {
    for name, zone in data.aws_availability_zone.all :
    zone.name_suffix => name
  }
}

data "aws_vpc" "default" {
  default = true
}
