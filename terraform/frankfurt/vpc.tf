provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "frankfurt_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "frankfurt-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.frankfurt_vpc.id
}
