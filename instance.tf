data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "pivada-ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet-privada.id
  vpc_security_group_ids = [aws_security_group.sg-privada-ec2.id]
  availability_zone      = "${var.regiao}a"
  iam_instance_profile   = aws_iam_instance_profile.ssm-profile.name

  tags = {
    Name = "${var.nome}-privada-ec2-1"
  }
}

