resource "aws_iam_instance_profile" "dev_instance_profile" {
  name = "instance_profile"
  role = aws_iam_role.dev_instance_role.name
}

resource "aws_instance" "dev" {
  count                  = var.enable_aws_amd64_dev ? 1 : 0
  ami                    = data.aws_ami.debian_x86.id
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.dev_instance_profile.name
  user_data              = file("user_data.sh")
  key_name               = "main"
  vpc_security_group_ids = [aws_security_group.main.id]
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.aws_instance_block_size
  }
  tags = {
    Name = "x86_dev"
    arch = "amd64"
  }
}

resource "aws_instance" "arm64_dev" {
  count                  = var.enable_aws_arm64_dev ? 1 : 0
  ami                    = data.aws_ami.debian_arm64.id
  instance_type          = "a1.medium"
  iam_instance_profile   = aws_iam_instance_profile.dev_instance_profile.name
  user_data              = file("user_data.sh")
  key_name               = "main"
  vpc_security_group_ids = [aws_security_group.main.id]
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.aws_instance_block_size
  }
  tags = {
    Name = "arm64_dev"
    arch = "arm64"
  }
}

resource "digitalocean_droplet" "do_dev" {
  count      = var.enable_do_instance ? 1 : 0
  region     = var.do_region
  image      = "ubuntu-20-04-x64"
  name       = "devbox"
  size       = "s-2vcpu-2gb-intel"
  backups    = true
  monitoring = true
  ssh_keys = [
    var.ssh_fingerprint
  ]
}
