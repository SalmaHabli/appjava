region       = "us-east-1"

# CIDR block utilisé à l’origine pour créer le VPC (facultatif ici si VPC est déjà créé)
vpc_cidr     = "10.0.0.0/16"

# Zones de disponibilité utilisées pour tes subnets
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Ces valeurs sont uniquement utiles si tu crées les subnets avec Terraform
public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

private_subnets = [
  "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24",
  "10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24",
  "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24", "10.0.15.0/24"
]

# L'ID de ton VPC existant
vpc_id = "vpc-0a91d95b8a7327fd8"

# Liste des IDs des subnets publics pour le Load Balancer
subnet_ids = [
  "subnet-0fe0395a651d1c3f8",
  "subnet-0ec107a2cff887aff",
  "subnet-0796aec7ac61177f9"
]

# Clé SSH pour les instances EC2
key_name = "pfs-key"

# AMI ID (Amazon Machine Image) utilisée pour créer les instances EC2
ami_id = "ami-02457590d33d576c3" # Amazon Linux 2 (correct)

# Port sur lequel l'application Java tourne
port = 8080
