region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

private_subnets = [
  "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24",
  "10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24",
  "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24", "10.0.15.0/24"
]
vpc_id     = "vpc-0dfbefee52c2260bc"
subnet_ids = ["subnet-0fe0395a651d1c3f8", "subnet-0ec107a2cff887aff", "subnet-0796aec7ac61177f9", ]
key_name   = "pfs-key"
ami_id     = "ami-02457590d33d576c3"
port       = 8080

