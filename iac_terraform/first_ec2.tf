provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "first_ec2_with_terraform" {
	ami = "ami-076e3a557efe1aa9c"
	instance_type = "t2.micro"
	tags = {
		Name = "hardik-ec2"
	}
}



