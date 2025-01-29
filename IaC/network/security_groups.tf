resource "aws_security_group" "integration_service_security_group" {
    name = "integration-service-security-group"
    description = "Allow inbound traffic in the vpc"
    vpc_id = module.vpc.vpc_id
    tags = var.tags
}