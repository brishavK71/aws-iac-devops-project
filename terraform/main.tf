provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "iac-project/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

module "network" {
  source = "./vpc.tf"
}

module "instances" {
  source = "./ec2.tf"
}
