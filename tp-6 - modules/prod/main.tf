provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-junior"
    key    = "junior-prod.tfstate"
    region     = "us-east-1"
  }
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.micro"
  aws_common_tag = {
    Name = "ec2-prod-junior"
  }
  sg_name = "prod-junior-sg"
}
