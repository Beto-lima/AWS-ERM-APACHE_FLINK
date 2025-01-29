variable "region" {
  description = "The AWS region where resources will be provisioned"
  type        = string
  default     = "us-east-2"
}

variable "tags" {
  description = "A map of tags to assign to all resources"
  type        = map(string)
}

variable "av_zone_a" {
  type = map(string)
  default = {
    us-east-2 = "us-east-2a"
  }
}

variable "av_zone_b" {
  type = map(string)
  default = {
    us-east-2 = "us-east-2b"
  }
}


