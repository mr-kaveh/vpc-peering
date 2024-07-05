provider "aws" {
  alias  = "frankfurt"
  region = "eu-central-1"
}

provider "aws" {
  alias  = "paris"
  region = "eu-west-3"
}

resource "aws_vpc_peering_connection" "peer" {
  provider                = aws.frankfurt
  peer_vpc_id             = data.terraform_remote_state.paris.outputs.vpc_id
  vpc_id                  = data.terraform_remote_state.frankfurt.outputs.vpc_id
  peer_region             = "eu-west-3"
  auto_accept             = false

  tags = {
    Name = "frankfurt-paris-peering"
  }
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  provider                  = aws.paris
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
}

data "terraform_remote_state" "frankfurt" {
  backend = "s3"
  config = {
    bucket = "your-frankfurt-terraform-state-bucket"
    key    = "vpc/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "terraform_remote_state" "paris" {
  backend = "s3"
  config = {
    bucket = "your-paris-terraform-state-bucket"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-3"
  }
}
