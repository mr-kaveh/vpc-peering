provider "aws" {
  region = "eu-west-3"
}

resource "aws_vpc" "paris_vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "paris-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.paris_vpc.id
}
