output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_1" {
    value = module.vpc.public_subnets[0]
}

output "public_subnet_2" {
    value = module.vpc.public_subnets[1]
}

output "integration_service_security_group_id" {
    value = aws_security_group.integration_service_security_group.id
}