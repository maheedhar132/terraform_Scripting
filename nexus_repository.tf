terraform {
  required_providers{
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "ap-south-1"
}

resource "aws_instance" "nexus_repository" {
  ami = "ami-0e6329e222e662a52"
  instance_type = "t2.medium"

  security_groups = [ "Nexus_sg" ]
}

resource "aws_security_group" "Nexus_sg" {
    ingress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "nexus_service port"
      from_port = 8081
      ipv6_cidr_blocks = [ "0.0.0.0/0" ]
      protocol = "tcp"
      self = false
      to_port = 8081
    } ]
  
}