terraform {
  backend "s3" {
    bucket = "tf-backend-abhishek"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  allowed_account_ids = [
    var.aws_account_number,
  ]
}
