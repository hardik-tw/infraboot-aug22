# data block with filter to get amazon linux latest ami 

data "aws_ami" "amazonlinux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
}

# aws ec2 instance resource block 

resource "aws_instance" "first_ec2_with_terraform" {
  ami             = data.aws_ami.amazonlinux.image_id
  instance_type   = var.instancetype
  security_groups = ["allow_ssh"]
  key_name        = "demo-key-pair"
  user_data       = file("userdata.txt")
  tags = {
    Name = var.name
  }
}

# AWS Security group resource block for allowing http and ssh

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH from the Public IP at Home"
  ingress {
    description = "allow ssh from Hardik home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
  ingress {
    description = "allow ssh from Hardik home"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow ssh from Hardik home"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow_SSH"
  }
}

# enable ebs encryption at aws account level
resource "aws_ebs_encryption_by_default" "example" {
  enabled = true
}
