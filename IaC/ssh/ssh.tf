resource "tls_private_key" "ssh_private_key" {
    algorithm = "RSA"
    rsa_bits = "4096"
}

resource "local_file" "ssh_private_key" {
    content = tls_private_key.ssh_private_key.private_key_pem
    filename = "generated/ssh/deployer"
}

resource "local_file" "ssh_public_key" {
    content = tls_private_key.ssh_private_key.public_key_openssh
    filename = "generated/ssh/deployer.pub"
}

resource "aws_key_pair" "deployer_key_name" {
    key_name = "${var.project}-${var.env}"
    public_key = tls_private_key.ssh_private_key.public_key_openssh
}