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

variable "aws_ami_owner_id" {
  type    = string
  default = "125523088429"
}

variable "aws_ami_centos_x86_64_id" {
  type    = string
  default = "ami-059f1cc52e6c85908"
}

variable "aws_ami_centos_arm64_id" {
  type    = string
  default = "ami-061a486e54da518df"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_account_number" {}
variable "do_token" {}
variable "ssh_fingerprint" {}
