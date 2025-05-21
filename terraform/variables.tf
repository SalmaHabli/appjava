variable "region" {
  description = "La région AWS"
  type        = string
  default     = "us-east-1"  # Choisissez la région appropriée
}

variable "vpc_cidr" {
  description = "CIDR block pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Liste des CIDR blocks pour les subnets publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "Liste des CIDR blocks pour les subnets privés"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24", "10.0.15.0/24"]
}

variable "azs" {
  description = "Liste des zones de disponibilité"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "nat_ami_id" {
  description = "AMI ID de l'instance NAT"
  type        = string
  default     = "ami-xxxxxxxx"  # Remplacez par l'AMI d'instance NAT appropriée pour votre région
}
