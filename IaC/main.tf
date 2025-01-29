locals {
  tags = {
   "project" = var.project
   "stage"   = var.env
  }
}

module "ssh" {
    source = "./ssh"
    project = var.project
    env = var.env
}

module "network" {
    source = "./network"
    region = var.region
    tags = local.tags
}

locals {
  configurations_json = jsonencode([
    {
      "Classification" : "flink-conf",
      "Properties" : {
        "parallelism.default" : "2",
        "taskmanager.numberOfTaskSlots" : "2",
        "taskmanager.memory.process.size" : "2G",
        "jobmanager.memory.process.size" : "1G",
        "execution.checkpointing.interval" : "180000",
        "execution.checkpointing.mode" : "EXACTLY_ONCE"
      }
    }
  ])
}

module "emr" {
  source = "./emr"
  project = var.project
  env = var.env
  tags = local.tags
  release_label = var.release_label
  applications = ["Hadoop", "Flink", "Zeppelin"]
  main_instance_type = var.main_instance_type
  main_instance_count = var.main_instance_count
  core_instance_type = var.core_instance_type
  core_instance_count = var.core_instance_count
  configurations = local.configurations_json
  key_name = module.ssh.deployer_key_name
  vpc_id = module.network.vpc_id
  public_subnets = module.network.public_subnet_2
  additional_security_group_id = module.network.integration_service_security_group_id
}   