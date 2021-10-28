data "aws_ami" "centos" {
  owners      = [var.aws_ami_owner_id]
  most_recent = true
  filter {
    name   = "image-id"
    values = [var.aws_ami_centos_x86_64_id]
  }
}

data "aws_ami" "centos_arm64" {
  owners      = [var.aws_ami_owner_id]
  most_recent = true
  filter {
    name   = "image-id"
    values = [var.aws_ami_centos_arm64_id]
  }
}

