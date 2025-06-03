output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}


output "nat_instance_id" {
  value = aws_instance.nat_instance.id
}
output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

