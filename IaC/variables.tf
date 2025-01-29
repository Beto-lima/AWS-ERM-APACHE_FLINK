variable "region" {
  description = "Region where the resources will be provisioned"
  type        = string
  default     = "us-east-2"
}

variable "release_label" {
  description = "Version label of the EMR"
  type        = string
}

variable "main_instance_type" {
  description = "Instance type for the main cluster in EMR"
  type        = string
}

variable "main_instance_count" {
  description = "Number of main instances in the EMR cluster"
  type        = number
}

variable "core_instance_type" {
  description = "Instance type for the core layer of the EMR cluster"
  type        = string
}

variable "core_instance_count" {
  description = "Number of instances in the core layer of the EMR cluster"
  type        = number
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Deployment environment"
  type        = string
}


