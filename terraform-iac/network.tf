resource "aws_vpc" "mindlab-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = "mindlab-vpc"
  }
}



# public subnet resources
resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.mindlab-vpc.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  # DNS and public
  #  enable_dns64 = true
  enable_resource_name_dns_a_record_on_launch = true
  #  enable_resource_name_dns_aaaa_record_on_launch = true
  map_public_ip_on_launch = true

  tags = {
    Name = "prodxcloud Public Subnet ${count.index + 1}"
  }

  lifecycle {
    prevent_destroy = true
  }
}

# private subnet resources
resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.mindlab-vpc.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "prodxcloud Private Subnet ${count.index + 1}"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mindlab-vpc.id

  tags = {
    Name = "prodxcloud VPC Internet Gateway"
  }
}
# 2 aws route table route
resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.mindlab-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "2nd Route Table"
  }
}

# Associate Public Subnets with the Second Route Table
resource "aws_route_table_association" "public_subnet_asso" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.second_rt.id

}

output "VPCID" {
  value = aws_vpc.mindlab-vpc.id
}