locals {
  vpc_id    = "vpc-63a2b319"
  user_name = "arai"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "do_region" {
  type    = string
  default = "sfo3"
}

variable "enable_aws_amd64_dev" {
  type    = bool
  default = false
}

variable "enable_aws_arm64_dev" {
  type    = bool
  default = false
}

variable "enable_do_instance" {
  type    = bool
  default = false
}

variable "aws_instance_block_size" {
  type    = number
  default = 32
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_account_number" {}
variable "do_token" {}
variable "ssh_fingerprint" {}
