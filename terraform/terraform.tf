terraform {
  backend "s3" {
    bucket         = "tf-backend-abhishek"
    key            = "terraform/terraform.tfstate"
    dynamodb_table = "tf-state-lock"
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::408911611184:role/github_oidc_role"
  }
  required_version = "~> 1.4.6"
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
  assume_role {
    role_arn     = "arn:aws:iam::408911611184:role/github_oidc_role"
  }
  allowed_account_ids = [
    var.aws_account_number,
  ]
}

provider "digitalocean" {
  token = var.do_token
}
