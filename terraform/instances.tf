data "aws_ami" "centos" {
  owners      = ["125523088429"]
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-059f1cc52e6c85908"]
  }
}

data "aws_ami" "ubuntu_arm64" {
  owners      = ["591542846629"]
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-0ae3143bc8c29507d"]
  }
}


resource "aws_instance" "dev" {
  count                  = 1
  ami                    = data.aws_ami.centos.id
  instance_type          = "t2.micro"
  #user_data              = file("user_data.sh")
  key_name               = "aws"
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_instance" "arm64_dev" {
  count                  = 1
  ami                    = data.aws_ami.ubuntu_arm64.id
  instance_type          = "a1.medium"
  #user_data              = file("user_data.sh")
  key_name               = "aws"
  vpc_security_group_ids = [aws_security_group.main.id]
}
