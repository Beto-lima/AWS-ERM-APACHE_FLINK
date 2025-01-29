variable "project" { }
variable "env" { }
variable "tags" { }
variable "key_name" {
  type = string
 }
variable "vpc_id" { }
variable "public_subnets" { }
variable "additional_security_group_id" { }
variable "release_label" { }
variable "applications" { }
variable "main_instance_type" { }
variable "main_instance_count" { }
variable "core_instance_type" { }
variable "core_instance_count" { }
variable "core_instance_ebs_volume_size" { default = 80 }
variable "security_configuration_name" { default = null }
variable "log_uri" { default = "s3://emr-project-724772087521" }
variable "configurations" { }

variable "steps" {
  type = list(object(
    {
      name = string
      action_on_failure = string
      hadoop_jar_step = list(object(
        {
          args       = list(string)
          jar        = string
          main_class = string
          properties = map(string)
        }
      ))
    }
  ))
  default = null
}

variable "bootstrap_action" {
  type = set(object(
    {
      name = string
      path = string
      args = list(string)
    }
  ))
  default = []
}

variable "kerberos_attributes" {
  type = set(object(
    {
      kdc_admin_password = string
      realm              = string
    }
  ))
  default = []
}