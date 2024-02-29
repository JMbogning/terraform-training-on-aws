provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-junior"
    key    = "junior-dev.tfstate"
    region     = "us-east-1"
  }
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.nano"
  aws_common_tag = {
    Name = "ec2-dev-junior"
  }
  sg_name = "dev-junior-sg"
}
