provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}
// hada mshto hit le nat gatway l9itha anaha madakhlax f free tiers khask tkhalss 36dh par hure je pense
# NAT Gateway
/*resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = {
    Name = "main-nat-gw"
  }
}*/









# Subnets publics (Web)
resource "aws_subnet" "public_subnet" {
  count = 3
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_subnets, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Subnets privés (App, DB, etc.)
resource "aws_subnet" "private_subnet" {
  count = 12
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_subnets, count.index)
  availability_zone = element(var.azs, count.index % 3)
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

# Tables de routage pour subnets publics
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# Association de la route avec les subnets publics
resource "aws_route_table_association" "public_route_assoc" {
  count          = 3
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

