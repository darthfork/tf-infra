data "aws_ami" "centos" {
  owners      = ["408911611184"]
  most_recent = true
  filter {
    name = "image-id"
    values = ["ami-0bae877500a55a46f"]
  }
}

resource "aws_instance" "dev" {
  ami = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name = "aws"
  vpc_security_group_ids = [aws_security_group.main.id]
}
