variable "backend_bucket_name" {
  default = "tf-infra-backend-bucket"
  type    = string
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "aws_account_number" {
  type = string
}

variable  "aws_username" {
  type  = string
}

variable "do_token" {
  type = string
}
variable "ssh_fingerprint" {
  type = string
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
  default = true
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
  default = "136693071363"
}
