
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}

provider "aws" {
  # Configuration options
 region = "us-east-1"
}


resource "aws_instance" "LinuxPublic_call" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  key_name = "04May2024"

  tags = {
    Name = "LinuxPublic1"
  }
}


resource "aws_security_group" "Security_group_call" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "Linux_Security_Group"
  }
}


resource "aws_vpc_security_group_ingress_rule" "Security_group_ingress_call" {
  security_group_id = aws_security_group.Security_group_call.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "tcp"
  to_port           = 443
}

