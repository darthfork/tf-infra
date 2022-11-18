terraform {
  backend "s3" {
    bucket         = "tf-backend-abhishek"
    key            = "terraform/terraform.tfstate"
    dynamodb_table = "tf-state-lock"
    region         = "us-east-1"
  }
  required_version = "~> 1.3.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  allowed_account_ids = [
    var.aws_account_number,
  ]
}

provider "digitalocean" {
  token = var.do_token
}
