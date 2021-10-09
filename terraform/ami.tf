data "aws_ami" "centos" {
  owners      = ["125523088429"]
  most_recent = true
  filter {
    name   = "image-id"
    values = [var.aws_ami_centos_x86_64_id]
  }
}

data "aws_ami" "centos_arm64" {
  owners      = ["125523088429"]
  most_recent = true
  filter {
    name   = "image-id"
    values = [var.aws_ami_centos_arm64_id]
  }
}

