data "aws_ami" "centos" {
  owners      = ["125523088429"]
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-059f1cc52e6c85908"]
  }
}

data "aws_ami" "centos_arm64" {
  owners      = ["125523088429"]
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-0c7ec43a152e9c107"]
  }
}

