data "aws_ami" "centos" {
  owners      = [var.aws_ami_owner_id]
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS 8.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ami" "centos_arm64" {
  owners      = [var.aws_ami_owner_id]
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS 8.*"]
  }

  filter {
    name   = "architecture"
    values = ["arm64"]
  }
}
