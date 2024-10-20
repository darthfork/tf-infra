data "aws_ami" "debian_x86" {
  owners      = [var.aws_ami_owner_id]
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-12*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ami" "debian_arm64" {
  owners      = [var.aws_ami_owner_id]
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-12*"]
  }

  filter {
    name   = "architecture"
    values = ["arm64"]
  }
}
