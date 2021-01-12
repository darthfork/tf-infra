data "aws_ami" "centos" {
  owners      = ["125523088429"]
  most_recent = true
  filter {
    name = "image-id"
    values = ["ami-059f1cc52e6c85908"]
  }
}

resource "aws_instance" "dev" {
  ami = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name = "aws"
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_instance" "de2v" {
  ami = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name = "aws"
  vpc_security_group_ids = [aws_security_group.main.id]
}
