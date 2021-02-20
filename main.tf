# Provider
provider "aws" {
    region = "us-east-2"
}

# Retrieve the AZ where we want to create network resources
data "aws_availability_zones" "available" {}

# VPC Resource
resource "aws_vpc" "vpc1" {
  cidr_block = "172.31.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc1"
    Environment = "Production"
  }
}

# AWS subnet resource
resource "aws_subnet" "subnet1" {
  #vpc_id = "aws_vpc.vpc1.id"
  vpc_id = "vpc-41848c29"
  cidr_block = "172.31.0.0/20"
  #availability_zone = "data.aws_availability_zones.available.names[0]"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "subnet1"
  }
}
