terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_key_pair" "demo_key" {
  key_name   = "demo_ssh_key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_security_group"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
   description = "HTTP access"
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "server_1" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.demo_key.key_name
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name = "EC2-Instance-1"
  }
}

output "server_1_ssh" {
  value = "ssh -i ~/ssh/id_ed25519 ec2-user@${aws_instance.server_1.public_ip}"
}

resource "aws_instance" "server_2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.demo_key.key_name
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name = "EC2-Instance-2"
  }
}

output "server_2_ssh" {
  value = "ssh -i ~/ssh/id_ed25519 ec2-user@${aws_instance.server_1.public_ip}"
}
resource "aws_instance" "server_3" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.demo_key.key_name
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name = "EC2-Instance-3"
  }
}

output "server_3_ssh" {
  value = "ssh -i ~/ssh/id_ed25519 ec2-user@${aws_instance.server_1.public_ip}"
}