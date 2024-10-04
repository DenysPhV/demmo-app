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

variable "instance_count" {
  default = "0"
}

variable "instance_type" {
  default = "t2.micro"
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



