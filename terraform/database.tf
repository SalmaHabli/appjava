resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = slice(aws_subnet.private_subnet[*].id, 0, 3) # Utilise 3 subnets privés
}

resource "aws_security_group" "db_sg" {
  name        = "db-sg-${var.environment}"
  description = "Security group for database"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "javadb"
  username             = "admin"
  password             = "chaymae22" 
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot  = true
}
