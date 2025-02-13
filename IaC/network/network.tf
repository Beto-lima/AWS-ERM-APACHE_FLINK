module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "core"
    cidr = "10.0.0.0/16"
    azs = [lookup(var.av_zone_a, var.region), lookup(var.av_zone_b, var.region)]
    public_subnets = ["10.0.0.0/24", "10.0.2.0/24"]
    enable_dns_support = true
    enable_dns_hostnames = true
    enable_nat_gateway = false
    map_public_ip_on_launch = true
    tags = var.tags
}