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

resource "aws_instance" "dev" {
  count                  = 0
  ami                    = data.aws_ami.centos.id
  instance_type          = "t2.micro"
  user_data              = file("user_data.sh")
  key_name               = "main"
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_instance" "arm64_dev" {
  count                  = 0
  ami                    = data.aws_ami.centos_arm64.id
  instance_type          = "a1.medium"
  user_data              = file("user_data.sh")
  key_name               = "main"
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "digitalocean_droplet" "do_dev" {
  count              = 1
  region             = var.do_region
  image              = "ubuntu-20-04-x64"
  name               = "devbox"
  size               = "s-2vcpu-2gb-intel"
  backups            = true
  monitoring         = true
  private_networking = true
  ssh_keys = [
    var.ssh_fingerprint
  ]
}
