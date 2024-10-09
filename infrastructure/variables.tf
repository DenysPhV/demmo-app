variable "region" {}
variable "state_bucket" {}
variable "table_name" {}
variable "environment_id" {}
variable "environment_name" {}
variable "purpose" {}

variable "backend_url" {
  type = string
}

variable "frontend_url" {
  type = string
}

variable "my_ip" {}
variable "instance_count" {
  default = "1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "instance_key_name" {}
variable "instance_volume_size" {
  default = "10"
}

variable "instance_user" {
  default = "ec2-user"
}
variable "instance_key" {
  default = "C:/Users/User/.ssh/mindlab_key.pem"
}
variable "source_instance_internal_key" {
  default = "C:/Users/User/.ssh/id_ed25519"
}
variable "destination_instance_internal_key" {
  default = "/home/ec2-user/.ssh/id_ed25519"
}

variable "zones" {
  type = list(string)
  default = [
    "eu-west-3a",
    "eu-west-3b",
    "eu-west-3c"
  ]
  description = "List of availability zones"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
}

variable "public_zone_name" {
  description = "Public Hosted Zone Name"
}

variable "github_url" {}
variable "registration_token" {}
variable "runner_tags_list" {}
variable "runner_executor" {}



