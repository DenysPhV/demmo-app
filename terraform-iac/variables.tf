variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "mindlab_bucket" {}
variable "environment_name" {}
variable "environment_id" {}
variable "table_name" {}
variable "purpose" {}


variable "access_key" {
  default = ""
}
variable "secret_key" {
  default = ""
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "subnet" {
  default = "10.0.0.0/24"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "your ami-ID"
}

variable "publicip" {
  type = bool
  default = true
}

variable "instance_vpc_id" {
  type    = string
  default = "your vpc-ID"
}

variable "instance_subnet_id" {
  type    = string
  default = "your subnet-ID"
}

variable "instance_keyName" {
  type    = string
  default = "prodxcloud-ec2-keypair-1"
}

variable "instance_secgroupname" {
  description = "This is a security Group Name"
  type        = string
  default     = "prodxcloud-SG"
}

variable "instance_publicip" {
  type    = bool
  default = true
}

variable "aws_availability_zone" {
  type    = string
  default = "eu-west-3a"
}

# Public Subnet variable
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "prodxcloud Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# private Subnet variable
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "prodxcloud Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# avaiability zone variable
variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ingress_rules" {
  default = {
    "my ingress rule" = {
      "description" = "For HTTP"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },

    "all ingress rule" = {
      "description" = "All"
      "from_port"   = "0"
      "to_port"     = "9999"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },
    "my other ingress rule" = {
      "description" = "For SSH"
      "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },

    "Postgres port" = {
      "description" = "For HTTP postgres"
      "from_port"   = "5432"
      "to_port"     = "5432"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },

    "Jenkins port" = {
      "description" = "For Jenkins"
      "from_port"   = "8080"
      "to_port"     = "8080"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },

    "React Application port" = {
      "description" = "For React"
      "from_port"   = "3000"
      "to_port"     = "3000"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },

    "Django Application port" = {
      "description" = "For Django"
      "from_port"   = "8585"
      "to_port"     = "8585"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }

    "All Ports" = {
      "description" = "For HTTP all ports"
      "from_port"   = "3000"
      "to_port"     = "65535"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Security group rules"
}

