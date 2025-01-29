output "emr_main_address" {
  value = aws_emr_cluster.emr_cluster.master_public_dns
}
